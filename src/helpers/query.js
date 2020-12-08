module.exports = {
  getQueryWhere: (table, column_needed, column_where, value_where) => {
		return `SELECT ${column_needed} FROM ${table} WHERE ${column_where}=${value_where}`
	},
	queryGet: (table, column_needed, extra = '') => {
		return `SELECT ${column_needed} FROM ${table} ${extra}`
	},
	queryInsert: (table) => {
		return `INSERT INTO ${table} SET ?`
	},
	queryDelete: (table, where) => {
		return `DELETE FROM ${table} WHERE ${where}`
	},
	queryProduct: (extraJoin = '', where = '', extra = '') => {
		return `SELECT p.product_id, p.product_title, b.brand_name, c.category_name, p.product_price, p.product_qty, p.product_condition, p.product_description, p.created_at, p.updated_at FROM products AS p JOIN categories AS c ON c.category_id = p.category_id JOIN brands AS b ON b.brand_id = p.brand_id ${extraJoin} ${where} ${extra}`
	},
	queryProduct1: 'SELECT p.product_id, p.product_title, b.brand_name, c.category_name, p.product_price, p.product_qty, p.product_condition, p.product_description, p.created_at, p.updated_at FROM products AS p JOIN categories AS c ON c.category_id = p.category_id JOIN brands AS b ON b.brand_id = p.brand_id ',
	queryProduct2: 'SELECT p.product_id, p.product_title, b.brand_name, c.category_name, p.product_price, p.product_qty, p.product_condition, p.product_description, p.created_at, p.updated_at FROM products AS p JOIN categories AS c ON c.category_id = p.category_id JOIN brands AS b ON b.brand_id = p.brand_id ',
}
// SELECT p.product_id, p.product_title, co.color_code FROM `products` AS p JOIN product_colors AS pco ON p.product_id = pco.product_id  JOIN colors AS co ON pco.color_id = co.color_id WHERE co.color_code='#BEA9A9'
// SELECT p.product_id, p.product_title, b.brand_name, c.category_name, p.product_price, p.product_qty, p.product_condition, p.product_description, p.created_at, p.updated_at FROM products AS p JOIN categories AS c ON c.category_id = p.category_id JOIN brands AS b ON b.brand_id = p.brand_id JOIN product_colors AS pco ON pco.product_id=p.product_id WHERE pco.color_code='#FFFFFF'