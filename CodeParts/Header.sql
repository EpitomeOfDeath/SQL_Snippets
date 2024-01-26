/*
	Enter a complete query in @SelectStmnt.
	Enter a prefix for the columns if you need one.

	!!Add a WHERE 1 = 2 CLAUSE to avoid data loading.

	Generates:
	1. ColumnList for the columns in the SELECT Statement.
	2. DECLARE statements for variables representing the columns in the SELECT Statement.
	3. SET variable (@ColVar = Col) values from the columns in the SELECT Statement.

	Author:Micael Uthas (uthas.com)
*/