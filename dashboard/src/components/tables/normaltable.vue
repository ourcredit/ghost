<template>
  <div>
    <slot name="search" slot="search"></slot>
    <Table ref="tablesMain" :type="type" :data="data" :columns="columns" :stripe="stripe" :border="border"
      :show-header="showHeader" :width="width" :height="height" :loading="loading" :disabled-hover="disabledHover"
      :highlight-row="highlightRow" :row-class-name="rowClassName" :size="size" :no-data-text="noDataText"
      :no-filtered-data-text="noFilteredDataText" @on-current-change="onCurrentChange" @on-select="onSelect"
      @on-select-cancel="onSelectCancel" @on-select-all="onSelectAll" @on-selection-change="onSelectionChange"
      @on-sort-change="onSortChange" @on-filter-change="onFilterChange" @on-row-click="onRowClick"
      @on-row-dblclick="onRowDblclick" @on-expand="onExpand">
    </Table>
    <Row>
      <Page @on-change="pageIndex" @on-page-size-change="pageSize" v-if="pageable"
        :total="total" :current="currentIndex" :page-size="currentSize" show-total show-sizer show-elevator />
    </Row>
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
        default: true
      },
      filter: {
        type: Object,
        default: {}
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
      pageable: {
        type: Boolean,
        default () {
          return true
        }
      },
      loading: {
        type: Boolean,
        default: false
      }
    },
    data() {
      return {
        edittingCellId: '',
        edittingText: '',
        searchValue: ''
      }
    },
    methods: {
      pageIndex(e) {
        this.$store.dispatch(`${this.type}_index`, e);
        this.initTableData();
      },
      pageSize(e) {
       this.$store.dispatch(`${this.type}_size`, e);
        this.initTableData();
      },
      initTableData() {
        let params = {
          index: this.currentIndex,
          size: this.currentSize,
          where: this.filter
        };
        console.log(this.type)
        this.$store.dispatch(`${this.type}_list`, params);
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
        return this.$store.state[this.type].totalCount;
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
      value(val) {
        this.handleTableData()
        if (this.searchable) this.handleSearch()
      }
    },
    mounted() {
      this.initTableData()
    }
  }

</script>
