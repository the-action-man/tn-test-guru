document.addEventListener('turbolinks:load', function () {
  let titleColumnHeader = document.querySelector('.sort-by-title-js')

  if (titleColumnHeader) titleColumnHeader.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle () {
  let table = document.querySelector('.table')

  let sortedRows = selectTableRows(table)
  handleSorting(sortedRows)

  let sortedTable = createSortedTableElement(selectTableHeader(table), sortedRows)
  table.parentNode.replaceChild(sortedTable, table)
}

function handleSorting (sortedRows) {
  if (title_column_header.getAttribute('data-sort-state') === 'desc') {
    sortedRows.sort((row1, row2) => row1.cells[0].innerHTML > row2.cells[0].innerHTML ? 1 : -1)
    octicon_title_arrow_up.classList.remove('hide')
    octicon_title_arrow_down.classList.add('hide')
    title_column_header.setAttribute('data-sort-state', 'asc')
  } else {
    sortedRows.sort((row1, row2) => row1.cells[0].innerHTML < row2.cells[0].innerHTML ? 1 : -1)
    octicon_title_arrow_up.classList.add('hide')
    octicon_title_arrow_down.classList.remove('hide')
    title_column_header.setAttribute('data-sort-state', 'desc')
  }
}

function createSortedTableElement (tableHeaderRow, sortedRows) {
  let sortedTable = document.createElement('table')
  sortedTable.classList.add('table')
  sortedTable.appendChild(tableHeaderRow)

  for (let i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  return sortedTable
}

function selectTableRows (table) {
  let rows = selectAllTableRowsElements(table)
  let selectedRows = []

  // select all table rows except the first one which is the header
  for (let i = 1; i < rows.length; i++) {
    selectedRows.push(rows[i])
  }

  return selectedRows
}

function selectTableHeader (table) {
  return selectAllTableRowsElements(table)[0]
}

function selectAllTableRowsElements (table) {
  return table.querySelectorAll('tr')
}
