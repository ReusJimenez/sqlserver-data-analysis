--- SESIÓN 8 =======================================================================

------= begin transaction, try catch======
----==funciones, procedimientos y vistas====

begin tran 
UPDATE OFERTAS
SET NUMDOC= '001231230'
WHERE ID = 111083
SELECT * FROM OFERTAS WHERE ID = 111083
rollback tran
SELECT * FROM OFERTAS WHERE ID = 111083

--rollback

--commit  
--rollback
--select * from CLIENTES

--SELECT 1000/0

--SELECT FECHAaPERTURA + 'TEXT' FROM AGENCIAS


BEGIN TRY
			--SELECT 1000/0  --ERROR DE CALCULO
			
--INSERT INTO AGENCIAS(FECHAaPERTURA)  --ERROR DE INTEGRIDAD .... 
--VALUES('TEXT')
DECLARE @EDAD INT = 15


--INSERT INTO AGENCIAS(FECHAaPERTURA)  --ERROR DE INTEGRIDAD .... 
--VALUES('TEXT')

IF @EDAD < 18
	RAISERROR (N'es menor de edad no se le puede vender alcohol', -- Message text.
	16, -- Severity,
	1 -- State, 
	); -- Second argument.
	----ERROR GENERADO POR EL USUARIO...


	--	--ERROR DE ESCRITURA.
END TRY
BEGIN CATCH
	
	PRINT error_number()	
	PRINT error_severity()
	PRINT error_state() 
	PRINT error_procedure()
	PRINT error_line()	
	PRINT error_message()	
	PRINT USER_NAME ()    
	PRINT getdate()

	END CATCH


----------COMBINADO ------
SELECT * FROM [dbo].[ARQUITECTOS]


COMMIT

GO

SELECT * FROM ARQUITECTOS


BEGIN TRANSACTION 
BEGIN TRY
	DECLARE @EDAD INT = 20

	IF @EDAD < 18

	RAISERROR (N'es menor de edad no se le puede vender alcohol', -- Message text.
	16, -- Severity,
	1 -- State, 
	); -- Second argument. -----------------------------------------------------------------------


	INSERT INTO ARQUITECTOS(ID,NOMBRE , AA,NROPROYECTOS)
	VALUES(1,'NIXX',5,100)

	PRINT 'TODO OK'
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK ----------------------------------------

	PRINT error_number()	
	PRINT error_severity()
	PRINT error_state() 
	PRINT error_procedure()
	PRINT error_line()	
	PRINT error_message()	
	PRINT USER_NAME ()    
	PRINT getdate()

END CATCH
