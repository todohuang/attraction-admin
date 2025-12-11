<template>
  <div class="app-container">
    <!-- 路线信息 -->
    <el-card class="box-card" style="margin-bottom: 20px;">
      <div slot="header" class="clearfix">
        <span style="font-weight: bold; font-size: 16px;">路线信息</span>
      </div>
      <div>
        <el-descriptions :column="1" border>
          <el-descriptions-item label="路线名称">{{ routeName }}</el-descriptions-item>
          <el-descriptions-item label="路线ID">{{ routeId }}</el-descriptions-item>
        </el-descriptions>
      </div>
    </el-card>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAddPoi"
          v-hasPermi="['system:route:edit']"
        >添加POI</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          plain
          icon="el-icon-back"
          size="mini"
          @click="handleBack"
        >返回</el-button>
      </el-col>
    </el-row>

    <!-- POI列表 -->
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span style="font-weight: bold;">POI列表（拖拽行可调整顺序）</span>
      </div>

      <el-table
        v-loading="loading"
        :data="poiList"
        row-key="id"
        :header-cell-style="{background:'#f5f7fa'}"
      >
        <el-table-column label="拖拽" width="60" align="center">
          <template>
            <i class="el-icon-rank" style="cursor: move; font-size: 16px;"></i>
          </template>
        </el-table-column>
        <el-table-column label="序号" type="index" width="60" align="center">
          <template slot-scope="scope">
            {{ scope.$index + 1 }}
          </template>
        </el-table-column>
        <el-table-column label="POI名称" align="center" prop="poiName" />
        <el-table-column label="分类名称" align="center" prop="categoryName" />
        <el-table-column label="排序" align="center" prop="sortOrder" width="80" />
        <el-table-column label="操作" align="center" width="150">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleRemovePoi(scope.row)"
              v-hasPermi="['system:route:edit']"
            >移除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <el-empty v-if="!loading && poiList.length === 0" description="暂无POI数据，请添加"></el-empty>
    </el-card>

    <!-- 添加POI对话框 -->
    <el-dialog title="添加POI到路线" :visible.sync="openAddDialog" width="600px" append-to-body>
      <el-form ref="addForm" :model="addForm" label-width="100px">
        <el-form-item label="选择POI">
          <el-select
            v-model="addForm.poiIds"
            multiple
            filterable
            placeholder="请选择要添加的POI"
            style="width: 100%"
          >
            <el-option
              v-for="item in availablePoiList"
              :key="item.id"
              :label="item.poiName + ' (' + item.categoryName + ')'"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitAddPoi">确 定</el-button>
        <el-button @click="openAddDialog = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRoutePoi, addPoiToRoute, removePoiFromRoute, updatePoiSort } from "@/api/attraction/route";
import { listPoi } from "@/api/attraction/poi";
import Sortable from 'sortablejs';

export default {
  name: "RoutePoi",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 路线ID
      routeId: null,
      // 路线名称
      routeName: '',
      // POI列表
      poiList: [],
      // 可用POI列表
      availablePoiList: [],
      // 是否显示添加对话框
      openAddDialog: false,
      // 添加表单
      addForm: {
        poiIds: []
      }
    };
  },
  created() {
    this.routeId = this.$route.query.routeId;
    this.routeName = this.$route.query.routeName || '';
    if (this.routeId) {
      this.getList();
    } else {
      this.$modal.msgError("缺少路线ID参数");
      this.handleBack();
    }
  },
  mounted() {
    this.setSort();
  },
  methods: {
    /** 设置拖拽排序 */
    setSort() {
      const el = document.querySelectorAll('.el-table__body-wrapper > table > tbody')[0];
      if (!el) return;

      Sortable.create(el, {
        ghostClass: 'ghost',
        animation: 200,
        onEnd: (evt) => {
          const oldIndex = evt.oldIndex;
          const newIndex = evt.newIndex;

          // 更新本地数据
          const movedItem = this.poiList.splice(oldIndex, 1)[0];
          this.poiList.splice(newIndex, 0, movedItem);

          // 保存排序到服务器
          this.saveSort();
        }
      });
    },
    /** 保存排序 */
    saveSort() {
      // 构建排序数据
      const sortData = this.poiList.map((item, index) => ({
        id: item.id,
        sortOrder: index + 1
      }));

      // 保存排序
      updatePoiSort(sortData).then(response => {
        this.$modal.msgSuccess("排序保存成功");
      }).catch(() => {
        this.$modal.msgError("排序保存失败");
        this.getList(); // 恢复原来的顺序
      });
    },
    /** 查询路线POI列表 */
    getList() {
      this.loading = true;
      listRoutePoi(this.routeId).then(response => {
        this.poiList = response.data || [];
        this.loading = false;
        // 重新初始化拖拽
        this.$nextTick(() => {
          this.setSort();
        });
      }).catch(() => {
        this.loading = false;
      });
    },
    /** 查询可用POI列表 */
    getAvailablePoiList() {
      // 获取所有已发布的POI
      listPoi({ pageNum: 1, pageSize: 1000, isPublished: true }).then(response => {
        const allPoi = response.rows || [];
        // 过滤掉已经添加到路线的POI
        const currentPoiIds = this.poiList.map(item => item.poiId);
        this.availablePoiList = allPoi.filter(poi => !currentPoiIds.includes(poi.id));
      });
    },
    /** 返回按钮 */
    handleBack() {
      this.$router.push('/attraction/route');
    },
    /** 添加POI按钮 */
    handleAddPoi() {
      this.addForm.poiIds = [];
      this.getAvailablePoiList();
      this.openAddDialog = true;
    },
    /** 提交添加POI */
    submitAddPoi() {
      if (this.addForm.poiIds.length === 0) {
        this.$modal.msgWarning("请至少选择一个POI");
        return;
      }

      const data = {
        routeId: this.routeId,
        poiIds: this.addForm.poiIds
      };

      addPoiToRoute(data).then(response => {
        this.$modal.msgSuccess("添加成功");
        this.openAddDialog = false;
        this.getList();
      });
    },
    /** 移除POI */
    handleRemovePoi(row) {
      this.$modal.confirm('是否确认从路线中移除该POI？').then(function() {
        return removePoiFromRoute(row.id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("移除成功");
      }).catch(() => {});
    }
  }
};
</script>

<style scoped>
.ghost {
  opacity: 0.5;
  background: #c8ebfb;
}

.el-table >>> .el-table__body-wrapper .el-table__row {
  cursor: move;
}

.box-card {
  border-radius: 4px;
}
</style>
