/* Create Foreign Key Constraints */

ALTER TABLE ab_core_us.ACU_TAQUE ADD CONSTRAINT FK_ACU_TAQUE_AU_TCOMPANY
	FOREIGN KEY (COMPANY_COMPANY) REFERENCES ab_core_us.AU_TCOMPANY (COMPANY_COMPANY) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.AU_TCOMPANY ADD CONSTRAINT FK_AU_TCOMPANY_AU_TACCOUNT
	FOREIGN KEY (ACCOUNT_ACCOUNT) REFERENCES ab_core_us.AU_ACCOUNT (ACCOUNT_ACCOUNT) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.AU_TLOGIN ADD CONSTRAINT FK_AU_TLOGIN_US_USER
	FOREIGN KEY (USER_USER) REFERENCES ab_core_us.AU_TUSER (USER_USER) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.AU_TMEMBERSHIP ADD CONSTRAINT FK_AU_TMEMBERSHIP_AU_COMPANY
	FOREIGN KEY (COMPANY_COMPANY) REFERENCES ab_core_us.AU_TCOMPANY (COMPANY_COMPANY) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.AU_TMEMBERSHIP ADD CONSTRAINT FK_AU_TMEMBERSHIP_AU_TROL
	FOREIGN KEY (ROL_ROL) REFERENCES ab_core_us.AU_TROL (ROL_ROL) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.AU_TMEMBERSHIP ADD CONSTRAINT FK_AU_TMEMBERSHIP_AU_USER
	FOREIGN KEY (USER_USER) REFERENCES ab_core_us.AU_TUSER (USER_USER) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.CL_TCLIENT ADD CONSTRAINT FK_CL_TCLIENT_AU_TCOMPANY
	FOREIGN KEY (COMPANY_COMPANY) REFERENCES ab_core_us.AU_TCOMPANY (COMPANY_COMPANY) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.CL_TRECEIPT ADD CONSTRAINT FK_CL_TRECEIPT_CL_TCLIENT
	FOREIGN KEY (CLIENT_CLIENT) REFERENCES ab_core_us.CL_TCLIENT (CLIENT_CLIENT) ON DELETE No Action ON UPDATE No Action
;