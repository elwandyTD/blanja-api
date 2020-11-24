module.exports = {
  getQueryWhere: (table, column_needed, column_where, value_where) => {
		return `SELECT ${column_needed} FROM ${table} WHERE ${column_where}=${value_where}`
	},
	queryGet: (table, column_needed, extra) => {
		return `SELECT ${column_needed} FROM ${table} ${extra}`
	},
	queryInsert: (table) => {
		return `INSERT INTO ${table} SET ?`
	},
	queryDelete: (table, where) => {
		return `DELETE FROM ${table} WHERE ${where}`
	},
	queryProduct: 'SELECT p.product_id, p.product_title, b.brand_name, c.category_name, p.product_price, p.product_qty, p.product_condition, p.product_description, p.created_at, p.updated_at FROM products AS p JOIN categories AS c ON c.category_id = p.category_id JOIN brands AS b ON b.brand_id = p.brand_id ',
}