module.exports = {
	concatManyWhere: (forMapString, column) => {
		let where = ''
		forMapString.split(' ').map((eachSection) => {
			where += `${column}='${eachSection}' AND `
		})
		return where
	},
	concatOneWhere: (value, column) => {
		return `${column}='${value}' AND`
	},
	removeString: (url, stringFindReplace) => {
		if (url.includes(stringFindReplace)) {
			return url.replace(stringFindReplace, '')
		} 
		return url
	}
}