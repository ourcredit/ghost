<template>
  <div>
    <div v-if="searchable" class="search-con search-con-top">
      <Input @on-change="handleClear" clearable placeholder="输入关键字搜索" class="search-input" v-model="searchValue" />
      <Button @click="handleSearch" class="search-btn" type="primary">
        <Icon type="search" />&nbsp;&nbsp;搜索</Button>
    </div>
    <Table ref="tablesMain" :type="type" :data="insideTableData" :columns="columns" :stripe="stripe" :border="border"
      :show-header="showHeader" :width="width" :height="height" :loading="loading" :disabled-hover="disabledHover"
      :highlight-row="highlightRow" :row-class-name="rowClassName" :size="size" :no-data-text="noDataText"
      :no-filtered-data-text="noFilteredDataText" @on-current-change="onCurrentChange" @on-select="onSelect"
      @on-select-cancel="onSelectCancel" @on-select-all="onSelectAll" @on-selection-change="onSelectionChange"
      @on-sort-change="onSortChange" @on-filter-change="onFilterChange" @on-row-click="onRowClick"
      @on-row-dblclick="onRowDblclick" @on-expand="onExpand">
      <Page @on-change="initTableData" :total="total" :current="currentIndex" :page-size="size" show-total show-sizer
        show-elevator />
    </Table>
  </div>
</template>

<script>
  import handleBtns from './handle-btns'
  import './index.less'
  export default {
    name: 'Tables',
    props: {
      type: {
        type: String,
        default () {
          return ""
        }
      },
      columns: {
        type: Array,
        default () {
          return []
        }
      },
      size: String,
      width: {
        type: [Number, String]
      },
      height: {
        type: [Number, String]
      },
      stripe: {
        type: Boolean,
        default: false
      },
      border: {
        type: Boolean,
        default: false
      },
      showHeader: {
        type: Boolean,
        default: true
      },
      highlightRow: {
        type: Boolean,
        default: false
      },
      rowClassName: {
        type: Function,
        default () {
          return ''
        }
      },
      context: {
        type: Object
      },
      noDataText: {
        type: String
      },
      noFilteredDataText: {
        type: String
      },
      disabledHover: {
        type: Boolean
      },
      loading: {
        type: Boolean,
        default: false
      },
      /**
       * @description 全局设置是否可编辑
       */
      editable: {
        type: Boolean,
        default: false
      },
      /**
       * @description 是否可搜索
       */
      searchable: {
        type: Boolean,
        default: false
      }
    },
    data() {
      return {
        insideTableData: [],
        edittingCellId: '',
        edittingText: '',
        searchValue: '',
        searchKey: ''
      }
    },
    methods: {
      suportEdit(item, index) {
        item.render = (h, params) => {
          return h(TablesEdit, {
            props: {
              params: params,
              value: this.insideTableData[params.index][params.column.key],
              edittingCellId: this.edittingCellId,
              editable: this.editable
            },
            on: {
              'input': val => {
                this.edittingText = val
              },
              'on-start-edit': (params) => {
                this.edittingCellId = `editting-${params.index}-${params.column.key}`
                this.$emit('on-start-edit', params)
              },
              'on-cancel-edit': (params) => {
                this.edittingCellId = ''
                this.$emit('on-cancel-edit', params)
              },
              'on-save-edit': (params) => {
                this.value[params.row.initRowIndex][params.column.key] = this.edittingText
                this.$emit('input', this.value)
                this.$emit('on-save-edit', Object.assign(params, {
                  value: this.edittingText
                }))
                this.edittingCellId = ''
              }
            }
          })
        }
        return item
      },
      surportHandle(item) {
        let options = item.options || []
        let insideBtns = []
        options.forEach(item => {
          if (handleBtns[item]) insideBtns.push(handleBtns[item])
        })
        let btns = item.button ? [].concat(insideBtns, item.button) : insideBtns
        item.render = (h, params) => {
          params.tableData = this.value
          return h('div', btns.map(item => item(h, params, this)))
        }
        return item
      },
      setDefaultSearchKey() {
        this.searchKey = this.columns[0].key !== 'handle' ? this.columns[0].key : (this.columns.length > 1 ? this
          .columns[1].key : '')
      },
      handleClear(e) {
        if (e.target.value === '') this.insideTableData = this.value
      },
      //搜索 todo 网络形式
      handleSearch() {
        this.insideTableData = this.value.filter(item => item[this.searchKey].indexOf(this.searchValue) > -1)
      },
      initTableData() {
        let params = {
          index: this.currentIndex,
          size: this.currentSize,
          where: {}
        };
        console.log(params)
        this.$store.dispatch({
          type: `${this.type}_users`,
          data: params
        });
      },
      clearCurrentRow() {
        this.$refs.talbesMain.clearCurrentRow()
      },
      onCurrentChange(currentRow, oldCurrentRow) {
        this.$emit('on-current-change', currentRow, oldCurrentRow)
      },
      onSelect(selection, row) {
        this.$emit('on-select', selection, row)
      },
      onSelectCancel(selection, row) {
        this.$emit('on-select-cancel', selection, row)
      },
      onSelectAll(selection) {
        this.$emit('on-select-all', selection)
      },
      onSelectionChange(selection) {
        this.$emit('on-selection-change', selection)
      },
      onSortChange(column, key, order) {
        this.$emit('on-sort-change', column, key, order)
      },
      onFilterChange(row) {
        this.$emit('on-filter-change', row)
      },
      onRowClick(row, index) {
        this.$emit('on-row-click', row, index)
      },
      onRowDblclick(row, index) {
        this.$emit('on-row-dblclick', row, index)
      },
      onExpand(row, status) {
        this.$emit('on-expand', row, status)
      }
    },
    computed: {
      total() {
        console.log(this.$store);
        return this.$store.state[this.type].total;
      },
      currentIndex() {
        return this.$store.state[this.type].index;
      },
      currentSize() {
        return this.$store.state[this.type].size;
      },
      data() {
        return this.$store.state[this.type].list;
      }
    },
    watch: {
      columns(columns) {
        this.setDefaultSearchKey()
      },
      value(val) {
        this.handleTableData()
        if (this.searchable) this.handleSearch()
      }
    },
    mounted() {
      console.log(this.$store);
      this.setDefaultSearchKey()
      this.initTableData()
    }
  }

</script>
