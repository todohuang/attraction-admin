<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="分类名称" prop="categoryName">
        <el-input
          v-model="queryParams.categoryName"
          placeholder="请输入分类名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="isActive">
        <el-select
          v-model="queryParams.isActive"
          placeholder="请选择状态"
          clearable
        >
          <el-option label="启用" :value="true"></el-option>
          <el-option label="禁用" :value="false"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:category:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:category:remove']"
          >删除</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="categoryList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="分类名称" align="center" prop="categoryName" />
      <!-- <el-table-column label="图标URL" align="center" prop="iconUrl" :show-overflow-tooltip="true" /> -->
      <el-table-column label="排序" align="center" prop="sortOrder" />
      <el-table-column label="状态" align="center" prop="isActive">
        <template slot-scope="scope">
          <el-tag :type="scope.row.isActive ? 'success' : 'danger'">
            {{ scope.row.isActive ? "启用" : "禁用" }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{
            parseTime(scope.row.createTime, "{y}-{m}-{d} {h}:{i}:{s}")
          }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:category:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:category:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改POI分类对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="分类名称" prop="categoryName">
          <el-input v-model="form.categoryName" placeholder="请输入分类名称" />
        </el-form-item>
        <!-- <el-form-item label="图标URL" prop="iconUrl">
          <el-input v-model="form.iconUrl" placeholder="请输入图标URL" />
        </el-form-item> -->
        <el-form-item label="排序" prop="sortOrder">
          <el-input-number
            v-model="form.sortOrder"
            controls-position="right"
            :min="0"
          />
        </el-form-item>
        <el-form-item label="图标类型">
          <el-radio-group
            v-model="form.iconType"
            @change="handleIconTypeChange"
          >
            <el-radio label="default">默认</el-radio>
            <el-radio label="emoji">Emoji</el-radio>
            <el-radio label="image">图片</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="图标内容" v-if="form.iconType !== 'default'">
          <div v-if="form.iconType === 'emoji'">
            <el-input
              v-model="form.iconValue"
              placeholder="请输入Emoji字符 (如: 🚻)"
              style="width: 200px; margin-bottom: 10px"
            />
            <div class="emoji-picker">
              <div
                v-for="group in emojiGroups"
                :key="group.label"
                class="emoji-group"
              >
                <span class="group-label">{{ group.label }}</span>
                <div class="emoji-list">
                  <span
                    v-for="e in group.emojis"
                    :key="e"
                    class="emoji-item"
                    @click="form.iconValue = e"
                    >{{ e }}</span
                  >
                </div>
              </div>
            </div>
          </div>
          <image-upload
            v-if="form.iconType === 'image'"
            v-model="form.iconValue"
            :limit="1"
          />
        </el-form-item>
        <el-form-item label="状态">
          <el-radio-group v-model="form.isActive">
            <el-radio :label="true">启用</el-radio>
            <el-radio :label="false">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listCategory,
  getCategory,
  delCategory,
  addCategory,
  updateCategory,
} from "@/api/attraction/category";

export default {
  name: "Category",
  data() {
    return {
      // 常用Emoji分组
      emojiGroups: [
        {
          label: "医疗与救助",
          emojis: [
            "🚑",
            "⛑️",
            "🏥",
            "🆘",
            "➕",
            "💊",
            "💉",
            "🩺",
            "🩹",
            "🧪",
            "🚨",
            "🛟",
            "⚕️",
            "🌡️",
            "🤒",
            "🤕",
            "🦷",
          ],
        },
        {
          label: "母婴与关怀",
          emojis: [
            "🚼",
            "🍼",
            "👶",
            "🤱",
            "🧸",
            "🧒",
            "👧",
            "👦",
            "👦🏻",
            "👧🏻",
            "👶🏻",
            "🧸",
            "🎀",
            "🎈",
            "🎠",
            "🍭",
            "👫",
          ],
        },
        {
          label: "商店与购物",
          emojis: [
            "🛍️",
            "🛒",
            "👜",
            "🎁",
            "🍦",
            "🥤",
            "🍬",
            "🍭",
            "🍫",
            "🧸",
            "🎈",
            "🎨",
            "📚",
            "👟",
            "👕",
            "👒",
            "💄",
            "💍",
            "💎",
            "🧢",
            "🕶️",
            "👒",
            "🏮",
            "🪁",
          ],
        },
        {
          label: "餐厅与美食",
          emojis: [
            "🥘",
            "🍔",
            "🍛",
            "🍜",
            "🍝",
            "🍕",
            "🍲",
            "🍱",
            "🥟",
            "🍢",
            "🍣",
            "🍦",
            "🍰",
            "🥤",
            "🍺",
            "🥪",
            "🍳",
            "🍢",
            "🍡",
            "🍵",
            "🥨",
            "🥐",
            "🥯",
            "🥗",
            "🍿",
            "🍧",
            "🍩",
            "🍫",
            "🥓",
          ],
        },
        {
          label: "卫生洗漱",
          emojis: [
            "🚻",
            "🚹",
            "🚺",
            "🚽",
            "🧼",
            "🧻",
            "🧴",
            "🚿",
            "🚰",
            "🛀",
            "🧼",
            "🪒",
            "🧽",
            "🧹",
            "🧺",
          ],
        },
        {
          label: "停车场与交通",
          emojis: [
            "🅿️",
            "🚗",
            "🚌",
            "🏍️",
            "🚲",
            "🚐",
            "🚕",
            "🔋",
            "🚏",
            "🚉",
            "🚆",
            "🛶",
            "🚡",
            "🚠",
            "🛥️",
            "🚢",
            "⚓",
            "⛽",
          ],
        },
        {
          label: "景观与娱乐",
          emojis: [
            "🎡",
            "🎢",
            "🎠",
            "🎟️",
            "🎭",
            "⛰️",
            "🏠",
            "🚬",
            "📷",
            "🗺️",
            "🚩",
            "⛺",
            "🌲",
            "🌸",
            "⛲",
            "⛩️",
            "🗿",
            "🔭",
            "🧗",
            "🚣",
            "🎣",
            "🎨",
            "🎺",
            "🎸",
            "🎻",
            "🎷",
            "🎆",
          ],
        },
        {
          label: "服务与告示",
          emojis: [
            "ℹ️",
            "🛎️",
            "🛄",
            "🛂",
            "🎫",
            "📞",
            "📡",
            "📢",
            "🔇",
            "🚶",
            "🏃",
            "🧳",
            "🔑",
            " DOOR ",
            "📪",
            "📮",
            "📤",
            "📥",
            "📫",
          ],
        },
      ],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // POI分类表格数据
      categoryList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        categoryName: null,
        isActive: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        categoryName: [
          { required: true, message: "分类名称不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询POI分类列表 */
    getList() {
      this.loading = true;
      listCategory(this.queryParams).then((response) => {
        this.categoryList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        categoryName: null,
        iconUrl: null,
        iconType: "default",
        iconValue: null,
        sortOrder: 0,
        isActive: true,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加POI分类";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getCategory(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改POI分类";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateCategory(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCategory(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal
        .confirm('是否确认删除POI分类编号为"' + ids + '"的数据项？')
        .then(function () {
          return delCategory(ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    // 图标类型切换逻辑 (增加智能判断，防止误删回显数据)
    handleIconTypeChange(val) {
      if (
        val === "emoji" &&
        this.form.iconValue &&
        this.form.iconValue.startsWith("/")
      ) {
        this.form.iconValue = "";
      } else if (
        val === "image" &&
        this.form.iconValue &&
        !this.form.iconValue.startsWith("/")
      ) {
        this.form.iconValue = "";
      }
    },
  },
};
</script>

<style scoped>
.emoji-picker {
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  padding: 10px;
  max-height: 200px;
  overflow-y: auto;
  background: #f8f9fb;
}
.emoji-group {
  margin-bottom: 12px;
}
.emoji-group:last-child {
  margin-bottom: 0;
}
.group-label {
  display: block;
  font-size: 12px;
  color: #909399;
  margin-bottom: 6px;
  font-weight: bold;
}
.emoji-list {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}
.emoji-item {
  font-size: 20px;
  cursor: pointer;
  padding: 4px;
  border-radius: 4px;
  transition: all 0.2s;
  line-height: 1;
}
.emoji-item:hover {
  background: #fff;
  transform: scale(1.2);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}
</style>
