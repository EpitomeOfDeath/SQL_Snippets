﻿SELECT
	IIF(ORDINAL_POSITION != 1, ', ', '')
	+ PARAMETER_NAME
	+ ' '
	+ CASE	
		WHEN USER_DEFINED_TYPE_NAME IS NOT NULL THEN
			CASE
				WHEN USER_DEFINED_TYPE_CATALOG != DB_NAME() THEN
					USER_DEFINED_TYPE_CATALOG + '.'
				ELSE
					''
				END
			+
			CASE
				WHEN USER_DEFINED_TYPE_SCHEMA != SCHEMA_NAME() THEN
					USER_DEFINED_TYPE_SCHEMA + '.'
				ELSE
					''
				END

		ELSE
			''
		END
	+ UPPER(ISNULL(USER_DEFINED_TYPE_NAME, DATA_TYPE))
	+ CASE
		WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL THEN
			'(' + IIF(CHARACTER_MAXIMUM_LENGTH = -1, 'MAX', CONVERT(VARCHAR, CHARACTER_MAXIMUM_LENGTH)) + ')'
		WHEN NUMERIC_PRECISION IS NOT NULL AND NUMERIC_SCALE > 0 AND CHARINDEX('MONEY', DATA_TYPE) = 0 THEN
			'(' + CONVERT(VARCHAR, NUMERIC_PRECISION) + ', ' + CONVERT(VARCHAR, NUMERIC_SCALE) + ')'
		WHEN DATETIME_PRECISION IS NOT NULL AND DATA_TYPE != 'DATETIME' THEN
			'(' + CONVERT(VARCHAR, DATETIME_PRECISION) + ')'
		ELSE
			''
		END
	+ IIF(PARAMETER_MODE = 'INOUT', ' OUT', '')
FROM
	INFORMATION_SCHEMA.PARAMETERS
WHERE SPECIFIC_NAME = 'sp_mutmp'
go