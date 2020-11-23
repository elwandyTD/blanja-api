module.exports = {
  getQueryWhere: (table, column_needed, column_where, value_where) => {
		return `SELECT ${column_needed} FROM ${table} WHERE ${column_where}=${value_where}`
	}
}