<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="POI名称" prop="poiName">
        <el-input
          v-model="queryParams.poiName"
          placeholder="请输入POI名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      
      <el-form-item label="所属区域" prop="areaCode">
        <el-select v-model="queryParams.areaCode" placeholder="请选择所属区域" clearable>
          <el-option
            v-for="dict in dict.type.attraction_area"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      
      <el-form-item label="分类" prop="categoryId">
        <el-select v-model="queryParams.categoryId" placeholder="请选择分类" clearable>
          <el-option
            v-for="item in categoryOptions"
            :key="item.id"
            :label="item.categoryName"
            :value="item.id"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="发布状态" prop="isPublished">
        <el-select v-model="queryParams.isPublished" placeholder="请选择发布状态" clearable>
          <el-option label="已发布" :value="true"></el-option>
          <el-option label="未发布" :value="false"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
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
          v-hasPermi="['system:poi:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:poi:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="poiList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" width="60" />
      <el-table-column label="POI名称" align="center" prop="poiName" />
      <el-table-column label="分类" align="center" prop="categoryName" />
      <el-table-column label="所属区域" align="center" prop="areaCode" width="100">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.areaCode === 'animal_kingdom'" type="success">动物王国</el-tag>
          <el-tag v-else-if="scope.row.areaCode === 'fantasy_town'" type="danger">奇幻小镇</el-tag>
          <el-tag v-else-if="scope.row.areaCode === 'mechanical_tribe'" style="background-color: #8B5CF6; color: white; border-color: #8B5CF6;">机械部落</el-tag>
          <el-tag v-else-if="scope.row.areaCode === 'storm_bay'" type="primary">风暴湾</el-tag>
          <span v-else style="color: #909399;">-</span>
        </template>
      </el-table-column>
      <el-table-column label="经度" align="center" prop="longitude" />
      <el-table-column label="纬度" align="center" prop="latitude" />
      <el-table-column label="发布状态" align="center" prop="isPublished" width="80">
        <template slot-scope="scope">
          <el-tag :type="scope.row.isPublished ? 'success' : 'info'">
            {{ scope.row.isPublished ? '已发布' : '未发布' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="150">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:poi:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:poi:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改POI点位信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="POI名称" prop="poiName">
              <el-input v-model="form.poiName" placeholder="请输入POI名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属区域" prop="areaCode">
              <el-select v-model="form.areaCode" placeholder="请选择所属区域" clearable>
                <el-option
                  v-for="dict in dict.type.attraction_area"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20">
            <el-form-item label="图标类型">
              <el-radio-group v-model="form.iconType" @change="handleIconTypeChange">
                <el-radio label="default">默认</el-radio>
                <el-radio label="emoji">Emoji</el-radio>
                <el-radio label="image">图片</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>

        <el-form-item label="图标内容" v-if="form.iconType !== 'default'">
          <div v-if="form.iconType === 'emoji'">
            <el-input v-model="form.iconValue" placeholder="请输入Emoji字符 (如: 🚻)" style="width: 200px; margin-bottom: 10px;" />
            <div class="emoji-picker">
              <div v-for="group in emojiGroups" :key="group.label" class="emoji-group">
                <span class="group-label">{{ group.label }}</span>
                <div class="emoji-list">
                  <span v-for="e in group.emojis" :key="e" class="emoji-item" @click="form.iconValue = e">{{ e }}</span>
                </div>
              </div>
            </div>
          </div>
          <image-upload v-if="form.iconType === 'image'" v-model="form.iconValue" :limit="1" />
        </el-form-item>

        <el-row>
          <el-col :span="12">
            <el-form-item label="所属分类" prop="categoryId">
              <el-select v-model="form.categoryId" placeholder="请选择分类">
                <el-option
                  v-for="item in categoryOptions"
                  :key="item.id"
                  :label="item.categoryName"
                  :value="item.id"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="辅分类" prop="secondaryCategoryIds">
              <el-select v-model="form.secondaryCategoryIds" multiple placeholder="请选择辅分类">
                <el-option
                  v-for="item in categoryOptions"
                  :key="item.id"
                  :label="item.categoryName"
                  :value="item.id"
                  :disabled="item.id === form.categoryId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row>
          <el-col :span="12">
            <el-form-item label="经度" prop="longitude">
              <el-input-number v-model="form.longitude" :precision="6" :step="0.000001" controls-position="right" style="width: 100%" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="纬度" prop="latitude">
              <el-input-number v-model="form.latitude" :precision="6" :step="0.000001" controls-position="right" style="width: 100%" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="简介" prop="description">
          <el-input v-model="form.description" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="营业时间" prop="operatingHours">
          <el-input v-model="form.operatingHours" placeholder="如: 09:00-18:00" />
        </el-form-item>
        <el-form-item label="语音文件" prop="voiceUrl">
          <file-upload
            v-model="form.voiceUrl"
            :limit="1"
            :file-size="20"
            :file-type="['mp3', 'wav', 'm4a', 'ogg', 'aac']"
            @upload-success="handleVoiceUploadSuccess"
            @file-remove="handleVoiceFileRemove"
          />
          <div v-if="form.voiceDuration" style="margin-top: 10px;">
            <el-tag type="info" size="medium">
              <i class="el-icon-time"></i>
              时长: {{ form.voiceDuration }}秒
              <span style="color: #909399;">({{ formatDuration(form.voiceDuration) }})</span>
            </el-tag>
          </div>
        </el-form-item>
        <el-form-item label="朗读文本" prop="voiceText">
          <el-input
            v-model="form.voiceText"
            type="textarea"
            :rows="3"
            placeholder="语音文本内容（无语音URL时使用TTS朗读此文本）"
          />
        </el-form-item>
        <el-form-item label="图片URL" prop="mainImageUrl" v-if="false">
          <el-input v-model="form.mainImageUrl" placeholder="请输入主要图片URL" />
        </el-form-item>
        <el-form-item label="是否发布">
          <el-radio-group v-model="form.isPublished">
            <el-radio :label="true">发布</el-radio>
            <el-radio :label="false">不发布</el-radio>
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
import { listPoi, getPoi, delPoi, addPoi, updatePoi } from "@/api/attraction/poi";
import { listCategory } from "@/api/attraction/category";

export default {
  name: "Poi",
  dicts: ['attraction_area'],
  data() {
    return {
      // 常用Emoji分组
      emojiGroups: [
        { label: '医疗与救助', emojis: ['🚑', '⛑️', '🏥', '🆘', '➕', '💊', '💉', '🩺', '🩹', '🧪', '🚨', '🛟', '⚕️', '🌡️', '🤒', '🤕', '🦷'] },
        { label: '母婴与关怀', emojis: ['🚼', '🍼', '👶', '🤱', '🧸', '🧒', '�', '👦', '👦🏻', '👧🏻', '👶🏻', '🧸', '🎀', '🎈', '🎠', '🍭', '👫'] },
        { label: '商店与购物', emojis: ['🛍️', '🛒', '👜', '🎁', '🍦', '🥤', '🍬', '🍭', '🍫', '🧸', '🎈', '🎨', '📚', '👟', '👕', '👒', '💄', '💍', '💎', '🧢', '🕶️', '👒', '🏮', '🪁'] },
        { label: '餐厅与美食', emojis: ['🥘', '🍔', '🍛', '🍜', '🍝', '🍕', '🍲', '🍱', '🥟', '🍢', '🍣', '🍦', '🍰', '🥤', '🍺', '🥪', '🍳', '🍢', '🍡', '🍵', '🥨', '🥐', '🥯', '🥗', '🍿', '🍧', '🍩', '🍫', '🥓'] },
        { label: '卫生间与洗漱', emojis: ['🚻', '🚹', '🚺', '🚽', '🧼', '🧻', '🧴', '🚿', '🚰', '🛀', '🧼', '🪒', '🧽', '🧹', '🧺'] },
        { label: '停车场与交通', emojis: ['🅿️', '🚗', '🚌', '🏍️', '🚲', '🚐', '🚕', '🔋', '🚏', '🚉', '🚆', '🛶', '🚡', '🚠', '🛥️', '🚢', '⚓', '⛽'] },
        { label: '景观与娱乐', emojis: ['🎡', '🎢', '🎠', '🎟️', '🎭', '⛰️', '🏠', '🚬', '📷', '🗺️', '🚩', '⛺', '🌲', '🌸', '⛲', '⛩️', '🗿', '🔭', '🧗', '🚣', '🎣', '🎨', '🎺', '🎸', '🎻', '🎷', '🎆'] },
        { label: '服务与告示', emojis: ['ℹ️', '🛎️', '🛄', '🛂', '🎫', '📞', '📡', '📢', '🔇', '🚶', '🏃', '🧳', '🔑', '🚪', '📪', '📮', '📤', '📥', '📫'] }
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
      // POI点位信息表格数据
      poiList: [],
      // 分类选项
      categoryOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        categoryId: null,
        poiName: null,
        areaCode: null,
        isPublished: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        categoryId: [
          { required: true, message: "所属分类不能为空", trigger: "change" }
        ],
        poiName: [
          { required: true, message: "POI名称不能为空", trigger: "blur" }
        ],
        longitude: [
          { required: true, message: "经度不能为空", trigger: "blur" }
        ],
        latitude: [
          { required: true, message: "纬度不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getCategoryOptions();
  },
  methods: {
    /** 查询POI点位信息列表 */
    getList() {
      this.loading = true;
      listPoi(this.queryParams).then(response => {
        this.poiList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询分类选项 */
    getCategoryOptions() {
      listCategory({pageNum: 1, pageSize: 100}).then(response => {
        this.categoryOptions = response.rows;
      });
    },
    // 图标类型切换逻辑 (增加智能判断，防止误删回显数据)
    handleIconTypeChange(val) {
      if (val === 'emoji' && this.form.iconValue && this.form.iconValue.startsWith('/')) {
        // 如果切到 Emoji，但当前值是图片路径，则清空
        this.form.iconValue = '';
      } else if (val === 'image' && this.form.iconValue && !this.form.iconValue.startsWith('/')) {
        // 如果切到图片，但当前值不是路径（可能是Emoji），则清空
        this.form.iconValue = '';
      }
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
        categoryId: null,
        poiName: null,
        longitude: null,
        latitude: null,
        description: null,
        operatingHours: null,
        voiceUrl: null,
        voiceText: null,
        voiceDuration: null,
        mainImageUrl: null,
        visitCount: 0,
        areaCode: null,
        secondaryCategoryIds: [],
        iconType: 'default',
        iconValue: null,
        isPublished: false
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加POI点位信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPoi(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改POI点位信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePoi(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPoi(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除POI点位信息编号为"' + ids + '"的数据项？').then(function() {
        return delPoi(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 音频上传成功后自动获取时长 */
    handleVoiceUploadSuccess(fileList) {
      if (fileList && fileList.length > 0) {
        const audioFile = fileList[fileList.length - 1]; // 获取最新上传的文件
        const audioUrl = this.getFullUrl(audioFile.url);
        
        // 使用 Audio API 读取音频时长
        const audio = new Audio(audioUrl);
        audio.addEventListener('loadedmetadata', () => {
          const duration = Math.round(audio.duration); // 四舍五入到整数秒
          this.form.voiceDuration = duration;
          this.$modal.msgSuccess(`已自动获取音频时长: ${duration}秒`);
        });
        audio.addEventListener('error', () => {
          this.$modal.msgWarning('无法自动获取音频时长，请手动输入');
        });
      }
    },
    /** 获取完整的文件URL */
    getFullUrl(url) {
      const baseUrl = process.env.VUE_APP_BASE_API;
      if (url.startsWith('http://') || url.startsWith('https://')) {
        return url;
      }
      return baseUrl + url;
    },
    /** 格式化音频时长（秒转分:秒） */
    formatDuration(seconds) {
      if (!seconds || seconds === 0) return '0分00秒';
      const minutes = Math.floor(seconds / 60);
      const remainingSeconds = seconds % 60;
      return `${minutes}分${remainingSeconds.toString().padStart(2, '0')}秒`;
    },
    /** 音频文件删除后清空时长 */
    handleVoiceFileRemove() {
      this.form.voiceDuration = null;
      this.$modal.msgInfo('已清空音频时长');
    }
  }
};
</script>

<style scoped>
.emoji-picker {
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  padding: 10px;
  max-height: 250px;
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
  font-size: 22px;
  cursor: pointer;
  padding: 4px;
  border-radius: 4px;
  transition: all 0.2s;
  line-height: 1;
}
.emoji-item:hover {
  background: #fff;
  transform: scale(1.2);
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}
</style>

