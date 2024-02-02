/* �����߰��̹��� */
CREATE TABLE STOREDETIALIMAGE (
	storeDetailImageId NUMBER NOT NULL, /* �����߰��̹���id */
	fk_storeId NUMBER, /* ����id */
	imageFile NVARCHAR2(255), /* �̹������� */
	position CHAR(2) /* ���� */
);

COMMENT ON TABLE STOREDETIALIMAGE IS '�����߰��̹���';

COMMENT ON COLUMN STOREDETIALIMAGE.storeDetailImageId IS '�����߰��̹���id';

COMMENT ON COLUMN STOREDETIALIMAGE.fk_storeId IS '����id';

COMMENT ON COLUMN STOREDETIALIMAGE.imageFile IS '�̹�������';

COMMENT ON COLUMN STOREDETIALIMAGE.position IS '����';

CREATE UNIQUE INDEX PK_STOREDETIALIMAGE
	ON STOREDETIALIMAGE (
		storeDetailImageId ASC
	);

ALTER TABLE STOREDETIALIMAGE
	ADD
		CONSTRAINT PK_STOREDETIALIMAGE
		PRIMARY KEY (
			storeDetailImageId
		);

/* ���ø���Ʈ */
CREATE TABLE WISHLIST (
	wishId NUMBER NOT NULL, /* ����id */
	fk_memberId NUMBER NOT NULL, /* ȸ��id */
	fk_productDetailId NUMBER NOT NULL, /* ��ǰ����id */
	isDeleted CHAR(1) NOT NULL, /* �������� */
	registerDay DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE WISHLIST IS '���ø���Ʈ';

COMMENT ON COLUMN WISHLIST.wishId IS '����id';

COMMENT ON COLUMN WISHLIST.fk_memberId IS 'ȸ��id';

COMMENT ON COLUMN WISHLIST.fk_productDetailId IS '��ǰ����id';

COMMENT ON COLUMN WISHLIST.isDeleted IS '��������';

COMMENT ON COLUMN WISHLIST.registerDay IS '�����';

CREATE UNIQUE INDEX PK_WISHLIST
	ON WISHLIST (
		wishId ASC
	);

ALTER TABLE WISHLIST
	ADD
		CONSTRAINT PK_WISHLIST
		PRIMARY KEY (
			wishId
		);

/* �������� */
CREATE TABLE STORECATEGORY (
	storeCategoryId NUMBER NOT NULL, /* ��������id */
	storeCategoryName NVARCHAR2(10) NOT NULL /* ���������� */
);

COMMENT ON TABLE STORECATEGORY IS '��������';

COMMENT ON COLUMN STORECATEGORY.storeCategoryId IS '��������id';

COMMENT ON COLUMN STORECATEGORY.storeCategoryName IS '����������';

CREATE UNIQUE INDEX PK_STORECATEGORY
	ON STORECATEGORY (
		storeCategoryId ASC
	);

ALTER TABLE STORECATEGORY
	ADD
		CONSTRAINT PK_STORECATEGORY
		PRIMARY KEY (
			storeCategoryId
		);

/* ��ǰ���� */
CREATE TABLE CATEGORY (
	categoryId NUMBER NOT NULL, /* ��ǰ����id */
	categoryName NVARCHAR2(10) NOT NULL /* ��ǰ���� */
);

COMMENT ON TABLE CATEGORY IS '��ǰ����';

COMMENT ON COLUMN CATEGORY.categoryId IS '��ǰ����id';

COMMENT ON COLUMN CATEGORY.categoryName IS '��ǰ����';

CREATE UNIQUE INDEX PK_CATEGORY
	ON CATEGORY (
		categoryId ASC
	);

ALTER TABLE CATEGORY
	ADD
		CONSTRAINT PK_CATEGORY
		PRIMARY KEY (
			categoryId
		);

/* �������÷� */
CREATE TABLE FRAMECOLOR (
	frameColorId NUMBER NOT NULL, /* �������÷�id */
	frameColorENG VARCHAR2(15) NOT NULL, /* �������÷����� */
	frameColorKOR NVARCHAR2(10) NOT NULL /* �������÷��ѱ� */
);

COMMENT ON TABLE FRAMECOLOR IS '�������÷�';

COMMENT ON COLUMN FRAMECOLOR.frameColorId IS '�������÷�id';

COMMENT ON COLUMN FRAMECOLOR.frameColorENG IS '�������÷�����';

COMMENT ON COLUMN FRAMECOLOR.frameColorKOR IS '�������÷��ѱ�';

CREATE UNIQUE INDEX PK_FRAMECOLOR
	ON FRAMECOLOR (
		frameColorId ASC
	);

ALTER TABLE FRAMECOLOR
	ADD
		CONSTRAINT PK_FRAMECOLOR
		PRIMARY KEY (
			frameColorId
		);

/* ��ǰ��з� */
CREATE TABLE PRODUCTGROUP (
	productGroupId NUMBER NOT NULL, /* ��ǰ��з�id */
	fk_categoryId NUMBER NOT NULL, /* ��ǰ����id */
	productGroupName NVARCHAR2(30) NOT NULL, /* ��ǰ�� */
	price NUMBER NOT NULL, /* ���� */
	fk_frameId NUMBER NOT NULL, /* ������id */
	fk_materialId NUMBER NOT NULL, /* ����id */
	silhouette NVARCHAR2(20) NOT NULL, /* �Ƿ翧 */
	detail NVARCHAR2(50) NOT NULL, /* ������ */
	frameSize NUMBER NOT NULL, /* �����ӻ����� */
	templeLength NUMBER NOT NULL, /* ���ñ��� */
	lenseWidthSize NUMBER NOT NULL, /* ����λ����� */
	lenseHeightSize NUMBER NOT NULL, /* ������̻����� */
	bridge NUMBER NOT NULL, /* �긴�� */
	isDeleted CHAR(1) NOT NULL, /* �������� */
	registerDay DATE DEFAULT sysdate NOT NULL, /* ����� */
	updateDay DATE /* ������Ʈ�� */
);

COMMENT ON TABLE PRODUCTGROUP IS '��ǰ��з�';

COMMENT ON COLUMN PRODUCTGROUP.productGroupId IS '��ǰ��з�id';

COMMENT ON COLUMN PRODUCTGROUP.fk_categoryId IS '��ǰ����id';

COMMENT ON COLUMN PRODUCTGROUP.productGroupName IS '��ǰ��';

COMMENT ON COLUMN PRODUCTGROUP.price IS '����';

COMMENT ON COLUMN PRODUCTGROUP.fk_frameId IS '������id';

COMMENT ON COLUMN PRODUCTGROUP.fk_materialId IS '����id';

COMMENT ON COLUMN PRODUCTGROUP.silhouette IS '�Ƿ翧';

COMMENT ON COLUMN PRODUCTGROUP.detail IS '������';

COMMENT ON COLUMN PRODUCTGROUP.frameSize IS '�����ӻ�����';

COMMENT ON COLUMN PRODUCTGROUP.templeLength IS '���ñ���';

COMMENT ON COLUMN PRODUCTGROUP.lenseWidthSize IS '����λ�����';

COMMENT ON COLUMN PRODUCTGROUP.lenseHeightSize IS '������̻�����';

COMMENT ON COLUMN PRODUCTGROUP.bridge IS '�긴��';

COMMENT ON COLUMN PRODUCTGROUP.isDeleted IS '��������';

COMMENT ON COLUMN PRODUCTGROUP.registerDay IS '�����';

COMMENT ON COLUMN PRODUCTGROUP.updateDay IS '������Ʈ��';

CREATE UNIQUE INDEX PK_PRODUCTGROUP
	ON PRODUCTGROUP (
		productGroupId ASC
	);

ALTER TABLE PRODUCTGROUP
	ADD
		CONSTRAINT PK_PRODUCTGROUP
		PRIMARY KEY (
			productGroupId
		);

/* ���� */
CREATE TABLE STORE (
	storeId NUMBER NOT NULL, /* ����id */
	storeName NVARCHAR2(20) NOT NULL, /* ������ */
	fk_countryId NUMBER NOT NULL, /* ��ġ����id */
	fk_storeCategoryId NUMBER NOT NULL, /* ��������id */
	cityENG NVARCHAR2(20) NOT NULL, /* �������ÿ� */
	cityKOR NVARCHAR2(20) NOT NULL, /* ���������� */
	address NVARCHAR2(255) NOT NULL, /* �ּ� */
	tel VARCHAR2(14) NOT NULL, /* ��ȭ��ȣ */
	openingHours VARCHAR2(30) NOT NULL, /* �����ð� */
	description NVARCHAR2(255) NOT NULL, /* �Ұ� */
	mainImageFile NVARCHAR2(255), /* ��ǥ������� */
	idDeleted CHAR(1), /* �������� */
	registerDay DATE DEFAULT sysdate NOT NULL, /* ����� */
	updateDay DATE /* ������Ʈ */
);

COMMENT ON TABLE STORE IS '����';

COMMENT ON COLUMN STORE.storeId IS '����id';

COMMENT ON COLUMN STORE.storeName IS '������';

COMMENT ON COLUMN STORE.fk_countryId IS '��ġ����id';

COMMENT ON COLUMN STORE.fk_storeCategoryId IS '��������id';

COMMENT ON COLUMN STORE.cityENG IS '�������ÿ�';

COMMENT ON COLUMN STORE.cityKOR IS '����������';

COMMENT ON COLUMN STORE.address IS '�ּ�';

COMMENT ON COLUMN STORE.tel IS '��ȭ��ȣ';

COMMENT ON COLUMN STORE.openingHours IS '�����ð�';

COMMENT ON COLUMN STORE.description IS '�Ұ�';

COMMENT ON COLUMN STORE.mainImageFile IS '��ǥ�������';

COMMENT ON COLUMN STORE.idDeleted IS '��������';

COMMENT ON COLUMN STORE.registerDay IS '�����';

COMMENT ON COLUMN STORE.updateDay IS '������Ʈ';

CREATE UNIQUE INDEX PK_STORE
	ON STORE (
		storeId ASC
	);

ALTER TABLE STORE
	ADD
		CONSTRAINT PK_STORE
		PRIMARY KEY (
			storeId
		);

/* ������ */
CREATE TABLE FRAME (
	frameId NUMBER NOT NULL, /* ������id */
	frameName NVARCHAR2(20) NOT NULL /* ������ */
);

COMMENT ON TABLE FRAME IS '������';

COMMENT ON COLUMN FRAME.frameId IS '������id';

COMMENT ON COLUMN FRAME.frameName IS '������';

CREATE UNIQUE INDEX PK_FRAME
	ON FRAME (
		frameId ASC
	);

ALTER TABLE FRAME
	ADD
		CONSTRAINT PK_FRAME
		PRIMARY KEY (
			frameId
		);

/* �ֹ� */
CREATE TABLE ORDER (
	orderId VARCHAR2(50) NOT NULL, /* �ֹ���ȣid */
	fk_memberId NUMBER NOT NULL, /* ȸ��id */
	deliveryFee NUMBER NOT NULL, /* ��ۺ� */
	amount NUMBER NOT NULL, /* �Ѱ����ݾ� */
	orderStatus CHAR(1) NOT NULL, /* �ֹ���Ȳ */
	refundReason CHAR(1) NOT NULL, /* ȯ�һ��� */
	name NVARCHAR2(15) NOT NULL, /* �޴»���̸� */
	postcode VARCHAR2(10) NOT NULL, /* �����ȣ */
	address NVARCHAR2(255) NOT NULL, /* �ּ� */
	detailAddress NVARCHAR2(255) NOT NULL, /* ���ּ� */
	tel VARCHAR2(14) NOT NULL, /* �޴º���ȭ��ȣ */
	orderDay DATE DEFAULT sysdate NOT NULL /* �ֹ���¥ */
);

COMMENT ON TABLE ORDER IS '�ֹ�';

COMMENT ON COLUMN ORDER.orderId IS '�ֹ���ȣid';

COMMENT ON COLUMN ORDER.fk_memberId IS 'ȸ��id';

COMMENT ON COLUMN ORDER.deliveryFee IS '��ۺ�';

COMMENT ON COLUMN ORDER.amount IS '�Ѱ����ݾ�';

COMMENT ON COLUMN ORDER.orderStatus IS '�ֹ���Ȳ';

COMMENT ON COLUMN ORDER.refundReason IS 'ȯ�һ���';

COMMENT ON COLUMN ORDER.name IS '�޴»���̸�';

COMMENT ON COLUMN ORDER.postcode IS '�����ȣ';

COMMENT ON COLUMN ORDER.address IS '�ּ�';

COMMENT ON COLUMN ORDER.detailAddress IS '���ּ�';

COMMENT ON COLUMN ORDER.tel IS '�޴º���ȭ��ȣ';

COMMENT ON COLUMN ORDER.orderDay IS '�ֹ���¥';

CREATE UNIQUE INDEX PK_ORDER
	ON ORDER (
		orderId ASC
	);

ALTER TABLE ORDER
	ADD
		CONSTRAINT PK_ORDER
		PRIMARY KEY (
			orderId
		);

/* ���� */
CREATE TABLE MATERIAL (
	materialId NUMBER NOT NULL, /* ����id */
	materialName NVARCHAR2(30) NOT NULL /* ���� */
);

COMMENT ON TABLE MATERIAL IS '����';

COMMENT ON COLUMN MATERIAL.materialId IS '����id';

COMMENT ON COLUMN MATERIAL.materialName IS '����';

CREATE UNIQUE INDEX PK_MATERIAL
	ON MATERIAL (
		materialId ASC
	);

ALTER TABLE MATERIAL
	ADD
		CONSTRAINT PK_MATERIAL
		PRIMARY KEY (
			materialId
		);

/* ��ǰ���� */
CREATE TABLE PRODUCTDETAIL (
	productDetailId NUMBER NOT NULL, /* ��ǰ����id */
	fk_productGroupId NUMBER NOT NULL, /* ��ǰ��з�id */
	fk_frameColorId NUMBER NOT NULL, /* �������÷�id */
	fk_lenseColorId NUMBER NOT NULL, /* �����÷�id */
	gender CHAR(1) NOT NULL, /* ���� */
	isMirror CHAR(1) NOT NULL, /* �̷����� */
	description NVARCHAR2(255) NOT NULL, /* �Ұ� */
	isTint CHAR(1) NOT NULL, /* ƾƮ���� */
	isGift CHAR(1) NOT NULL, /* ������õ���� */
	isBlueLight CHAR(1) NOT NULL, /* ������Ʈ���ܿ��� */
	stock NUMBER NOT NULL, /* ��� */
	isDeleted CHAR(1) NOT NULL, /* �������� */
	isIndex CHAR(1) NOT NULL, /* �ε�����ǰ���� */
	mainImageFile NVARCHAR2(255) NOT NULL, /* ��ǥ������� */
	registerDay DATE DEFAULT sysdate NOT NULL, /* ����� */
	updateDay DATE /* ������Ʈ�� */
);

COMMENT ON TABLE PRODUCTDETAIL IS '��ǰ����';

COMMENT ON COLUMN PRODUCTDETAIL.productDetailId IS '��ǰ����id';

COMMENT ON COLUMN PRODUCTDETAIL.fk_productGroupId IS '��ǰ��з�id';

COMMENT ON COLUMN PRODUCTDETAIL.fk_frameColorId IS '�������÷�id';

COMMENT ON COLUMN PRODUCTDETAIL.fk_lenseColorId IS '�����÷�id';

COMMENT ON COLUMN PRODUCTDETAIL.gender IS '����';

COMMENT ON COLUMN PRODUCTDETAIL.isMirror IS '�̷�����';

COMMENT ON COLUMN PRODUCTDETAIL.description IS '�Ұ�';

COMMENT ON COLUMN PRODUCTDETAIL.isTint IS 'ƾƮ����';

COMMENT ON COLUMN PRODUCTDETAIL.isGift IS '������õ����';

COMMENT ON COLUMN PRODUCTDETAIL.isBlueLight IS '������Ʈ���ܿ���';

COMMENT ON COLUMN PRODUCTDETAIL.stock IS '���';

COMMENT ON COLUMN PRODUCTDETAIL.isDeleted IS '��������';

COMMENT ON COLUMN PRODUCTDETAIL.isIndex IS '�ε�����ǰ����';

COMMENT ON COLUMN PRODUCTDETAIL.mainImageFile IS '��ǥ�������';

COMMENT ON COLUMN PRODUCTDETAIL.registerDay IS '�����';

COMMENT ON COLUMN PRODUCTDETAIL.updateDay IS '������Ʈ��';

CREATE UNIQUE INDEX PK_PRODUCTDETAIL
	ON PRODUCTDETAIL (
		productDetailId ASC
	);

ALTER TABLE PRODUCTDETAIL
	ADD
		CONSTRAINT PK_PRODUCTDETAIL
		PRIMARY KEY (
			productDetailId
		);

/* ��ġ���� */
CREATE TABLE COUNTRY (
	countryId NUMBER NOT NULL, /* ��ġ����id */
	countryName NVARCHAR2(20) NOT NULL /* ������ */
);

COMMENT ON TABLE COUNTRY IS '��ġ����';

COMMENT ON COLUMN COUNTRY.countryId IS '��ġ����id';

COMMENT ON COLUMN COUNTRY.countryName IS '������';

CREATE UNIQUE INDEX PK_COUNTRY
	ON COUNTRY (
		countryId ASC
	);

ALTER TABLE COUNTRY
	ADD
		CONSTRAINT PK_COUNTRY
		PRIMARY KEY (
			countryId
		);

/* ȸ�� */
CREATE TABLE MEMBER (
	memberId NUMBER NOT NULL, /* ȸ��id */
	email VARCHAR2(100) NOT NULL, /* �̸����ּ� */
	pwd VARCHAR2(50) NOT NULL, /* ��й�ȣ */
	gender CHAR(1), /* ���� */
	familyName NVARCHAR2(5) NOT NULL, /* �� */
	lastName NVARCHAR2(10) NOT NULL, /* �̸� */
	birth DATE NOT NULL, /* ������� */
	grade CHAR(1) NOT NULL, /* ��� */
	isDeleted CHAR(1) NOT NULL, /* ȸ��Ż�𿩺� */
	registerDay DATE DEFAULT sysdate NOT NULL, /* ����� */
	updateDay DATE /* ������Ʈ�� */
);

COMMENT ON TABLE MEMBER IS 'ȸ��';

COMMENT ON COLUMN MEMBER.memberId IS 'ȸ��id';

COMMENT ON COLUMN MEMBER.email IS '�̸����ּ�';

COMMENT ON COLUMN MEMBER.pwd IS '��й�ȣ';

COMMENT ON COLUMN MEMBER.gender IS '����';

COMMENT ON COLUMN MEMBER.familyName IS '��';

COMMENT ON COLUMN MEMBER.lastName IS '�̸�';

COMMENT ON COLUMN MEMBER.birth IS '�������';

COMMENT ON COLUMN MEMBER.grade IS '���';

COMMENT ON COLUMN MEMBER.isDeleted IS 'ȸ��Ż�𿩺�';

COMMENT ON COLUMN MEMBER.registerDay IS '�����';

COMMENT ON COLUMN MEMBER.updateDay IS '������Ʈ��';

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		memberId ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			memberId
		);

/* ��ǰ�߰��̹��� */
CREATE TABLE PRODUCTDETIALIMAGE (
	productDetailImageId NUMBER NOT NULL, /* ��ǰ�߰��̹���id */
	fk_productDetailId NUMBER NOT NULL, /* ��ǰ����id */
	imageFile NVARCHAR2(255) NOT NULL, /* �̹������ϸ� */
	position CHAR(2) NOT NULL /* ���� */
);

COMMENT ON TABLE PRODUCTDETIALIMAGE IS '��ǰ�߰��̹���';

COMMENT ON COLUMN PRODUCTDETIALIMAGE.productDetailImageId IS '��ǰ�߰��̹���id';

COMMENT ON COLUMN PRODUCTDETIALIMAGE.fk_productDetailId IS '��ǰ����id';

COMMENT ON COLUMN PRODUCTDETIALIMAGE.imageFile IS '�̹������ϸ�';

COMMENT ON COLUMN PRODUCTDETIALIMAGE.position IS '����';

CREATE UNIQUE INDEX PK_PRODUCTDETIALIMAGE
	ON PRODUCTDETIALIMAGE (
		productDetailImageId ASC
	);

ALTER TABLE PRODUCTDETIALIMAGE
	ADD
		CONSTRAINT PK_PRODUCTDETIALIMAGE
		PRIMARY KEY (
			productDetailImageId
		);

/* �ּҷ� */
CREATE TABLE ADDRESSBOOK (
	addressbookId NUMBER NOT NULL, /* �ּҷ�id */
	fk_memberId NUMBER NOT NULL, /* ȸ��id */
	familyName NVARCHAR2(5) NOT NULL, /* �� */
	lastName NVARCHAR2(10) NOT NULL, /* �̸� */
	tel VARCHAR2(14) NOT NULL, /* ��ȭ��ȣ */
	address NVARCHAR2(255) NOT NULL, /* �ּ� */
	detailAddress NVARCHAR2(255) NOT NULL, /* ���ּ� */
	postcode VARCHAR2(10) NOT NULL, /* �����ȣ */
	isDefaultAddr CHAR(1) NOT NULL, /* �⺻��������� */
	isDeleted CHAR(1) NOT NULL, /* �������� */
	registerDay DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE ADDRESSBOOK IS '�ּҷ�';

COMMENT ON COLUMN ADDRESSBOOK.addressbookId IS '�ּҷ�id';

COMMENT ON COLUMN ADDRESSBOOK.fk_memberId IS 'ȸ��id';

COMMENT ON COLUMN ADDRESSBOOK.familyName IS '��';

COMMENT ON COLUMN ADDRESSBOOK.lastName IS '�̸�';

COMMENT ON COLUMN ADDRESSBOOK.tel IS '��ȭ��ȣ';

COMMENT ON COLUMN ADDRESSBOOK.address IS '�ּ�';

COMMENT ON COLUMN ADDRESSBOOK.detailAddress IS '���ּ�';

COMMENT ON COLUMN ADDRESSBOOK.postcode IS '�����ȣ';

COMMENT ON COLUMN ADDRESSBOOK.isDefaultAddr IS '�⺻���������';

COMMENT ON COLUMN ADDRESSBOOK.isDeleted IS '��������';

COMMENT ON COLUMN ADDRESSBOOK.registerDay IS '�����';

CREATE UNIQUE INDEX PK_ADDRESSBOOK
	ON ADDRESSBOOK (
		addressbookId ASC
	);

ALTER TABLE ADDRESSBOOK
	ADD
		CONSTRAINT PK_ADDRESSBOOK
		PRIMARY KEY (
			addressbookId
		);

/* �����÷� */
CREATE TABLE LENSECOLOR (
	lenseColorId NUMBER NOT NULL, /* �����÷�id */
	lenseColorENG VARCHAR2(15) NOT NULL, /* �����÷����� */
	lenseColorKOR NVARCHAR2(10) NOT NULL /* �����÷��ѱ� */
);

COMMENT ON TABLE LENSECOLOR IS '�����÷�';

COMMENT ON COLUMN LENSECOLOR.lenseColorId IS '�����÷�id';

COMMENT ON COLUMN LENSECOLOR.lenseColorENG IS '�����÷�����';

COMMENT ON COLUMN LENSECOLOR.lenseColorKOR IS '�����÷��ѱ�';

CREATE UNIQUE INDEX PK_LENSECOLOR
	ON LENSECOLOR (
		lenseColorId ASC
	);

ALTER TABLE LENSECOLOR
	ADD
		CONSTRAINT PK_LENSECOLOR
		PRIMARY KEY (
			lenseColorId
		);

/* �ֹ��� */
CREATE TABLE ORDERDETAIL (
	orderDetailId VARCHAR2(50) NOT NULL, /* �ֹ��󼼹�ȣid */
	fk_orderId VARCHAR2(50) NOT NULL, /* �ֹ���ȣid */
	fk_productDetailId NUMBER NOT NULL, /* ��ǰ����id */
	price NUMBER NOT NULL, /* ���� */
	quantity NUMBER NOT NULL /* ���� */
);

COMMENT ON TABLE ORDERDETAIL IS '�ֹ���';

COMMENT ON COLUMN ORDERDETAIL.orderDetailId IS '�ֹ��󼼹�ȣid';

COMMENT ON COLUMN ORDERDETAIL.fk_orderId IS '�ֹ���ȣid';

COMMENT ON COLUMN ORDERDETAIL.fk_productDetailId IS '��ǰ����id';

COMMENT ON COLUMN ORDERDETAIL.price IS '����';

COMMENT ON COLUMN ORDERDETAIL.quantity IS '����';

CREATE UNIQUE INDEX PK_ORDERDETAIL
	ON ORDERDETAIL (
		orderDetailId ASC
	);

ALTER TABLE ORDERDETAIL
	ADD
		CONSTRAINT PK_ORDERDETAIL
		PRIMARY KEY (
			orderDetailId
		);

/* ��Ÿ�� */
CREATE TABLE STYLE (
	styleId NUMBER NOT NULL, /* ��Ÿ��id */
	fk_productDetailId NUMBER NOT NULL, /* ��ǰ����id */
	instaId VARCHAR(30) NOT NULL, /* �ν�Ÿ���̵� */
	imageFile NVARCHAR2(255) NOT NULL /* ������� */
);

COMMENT ON TABLE STYLE IS '��Ÿ��';

COMMENT ON COLUMN STYLE.styleId IS '��Ÿ��id';

COMMENT ON COLUMN STYLE.fk_productDetailId IS '��ǰ����id';

COMMENT ON COLUMN STYLE.instaId IS '�ν�Ÿ���̵�';

COMMENT ON COLUMN STYLE.imageFile IS '�������';

CREATE UNIQUE INDEX PK_STYLE
	ON STYLE (
		styleId ASC
	);

ALTER TABLE STYLE
	ADD
		CONSTRAINT PK_STYLE
		PRIMARY KEY (
			styleId
		);

/* ���ι� */
CREATE TABLE CART (
	cartId NUMBER NOT NULL, /* ���ι�id */
	fk_memberId NUMBER NOT NULL, /* ȸ��id */
	fk_productDetailId NUMBER NOT NULL, /* ��ǰ����id */
	quantity NUMBER NOT NULL, /* ���� */
	registerDay DATE DEFAULT sysdate NOT NULL /* ��ٱ��ϵ�ϳ�¥ */
);

COMMENT ON TABLE CART IS '���ι�';

COMMENT ON COLUMN CART.cartId IS '���ι�id';

COMMENT ON COLUMN CART.fk_memberId IS 'ȸ��id';

COMMENT ON COLUMN CART.fk_productDetailId IS '��ǰ����id';

COMMENT ON COLUMN CART.quantity IS '����';

COMMENT ON COLUMN CART.registerDay IS '��ٱ��ϵ�ϳ�¥';

CREATE UNIQUE INDEX PK_CART
	ON CART (
		cartId ASC
	);

ALTER TABLE CART
	ADD
		CONSTRAINT PK_CART
		PRIMARY KEY (
			cartId
		);

ALTER TABLE STOREDETIALIMAGE
	ADD
		CONSTRAINT FK_STORE_TO_STOREDETIALIMAGE
		FOREIGN KEY (
			fk_storeId
		)
		REFERENCES STORE (
			storeId
		);

ALTER TABLE WISHLIST
	ADD
		CONSTRAINT FK_MEMBER_TO_WISHLIST
		FOREIGN KEY (
			fk_memberId
		)
		REFERENCES MEMBER (
			memberId
		);

ALTER TABLE WISHLIST
	ADD
		CONSTRAINT FK_PRODUCTDETAIL_TO_WISHLIST
		FOREIGN KEY (
			fk_productDetailId
		)
		REFERENCES PRODUCTDETAIL (
			productDetailId
		);

ALTER TABLE PRODUCTGROUP
	ADD
		CONSTRAINT FK_CATEGORY_TO_PRODUCTGROUP
		FOREIGN KEY (
			fk_categoryId
		)
		REFERENCES CATEGORY (
			categoryId
		);

ALTER TABLE PRODUCTGROUP
	ADD
		CONSTRAINT FK_MATERIAL_TO_PRODUCTGROUP
		FOREIGN KEY (
			fk_materialId
		)
		REFERENCES MATERIAL (
			materialId
		);

ALTER TABLE PRODUCTGROUP
	ADD
		CONSTRAINT FK_FRAME_TO_PRODUCTGROUP
		FOREIGN KEY (
			fk_frameId
		)
		REFERENCES FRAME (
			frameId
		);

ALTER TABLE STORE
	ADD
		CONSTRAINT FK_COUNTRY_TO_STORE
		FOREIGN KEY (
			fk_countryId
		)
		REFERENCES COUNTRY (
			countryId
		);

ALTER TABLE STORE
	ADD
		CONSTRAINT FK_STORECATEGORY_TO_STORE
		FOREIGN KEY (
			fk_storeCategoryId
		)
		REFERENCES STORECATEGORY (
			storeCategoryId
		);

ALTER TABLE ORDER
	ADD
		CONSTRAINT FK_MEMBER_TO_ORDER
		FOREIGN KEY (
			fk_memberId
		)
		REFERENCES MEMBER (
			memberId
		);

ALTER TABLE PRODUCTDETAIL
	ADD
		CONSTRAINT FK_PRODUCTGROUP_TO_PRDCTDTL
		FOREIGN KEY (
			fk_productGroupId
		)
		REFERENCES PRODUCTGROUP (
			productGroupId
		);

ALTER TABLE PRODUCTDETAIL
	ADD
		CONSTRAINT FK_FRAMECOLOR_TO_PRODUCTDETAIL
		FOREIGN KEY (
			fk_frameColorId
		)
		REFERENCES FRAMECOLOR (
			frameColorId
		);

ALTER TABLE PRODUCTDETAIL
	ADD
		CONSTRAINT FK_LENSECOLOR_TO_PRODUCTDETAIL
		FOREIGN KEY (
			fk_lenseColorId
		)
		REFERENCES LENSECOLOR (
			lenseColorId
		);

ALTER TABLE PRODUCTDETIALIMAGE
	ADD
		CONSTRAINT FK_PRDCTDTL_TO_PRDCTDTLMG
		FOREIGN KEY (
			fk_productDetailId
		)
		REFERENCES PRODUCTDETAIL (
			productDetailId
		);

ALTER TABLE ADDRESSBOOK
	ADD
		CONSTRAINT FK_MEMBER_TO_ADDRESSBOOK
		FOREIGN KEY (
			fk_memberId
		)
		REFERENCES MEMBER (
			memberId
		);

ALTER TABLE ORDERDETAIL
	ADD
		CONSTRAINT FK_ORDER_TO_ORDERDETAIL
		FOREIGN KEY (
			fk_orderId
		)
		REFERENCES ORDER (
			orderId
		);

ALTER TABLE ORDERDETAIL
	ADD
		CONSTRAINT FK_PRODUCTDETAIL_TO_ORDRDTL
		FOREIGN KEY (
			fk_productDetailId
		)
		REFERENCES PRODUCTDETAIL (
			productDetailId
		);

ALTER TABLE STYLE
	ADD
		CONSTRAINT FK_PRODUCTDETAIL_TO_STYLE
		FOREIGN KEY (
			fk_productDetailId
		)
		REFERENCES PRODUCTDETAIL (
			productDetailId
		);

ALTER TABLE CART
	ADD
		CONSTRAINT FK_MEMBER_TO_CART
		FOREIGN KEY (
			fk_memberId
		)
		REFERENCES MEMBER (
			memberId
		);

ALTER TABLE CART
	ADD
		CONSTRAINT FK_PRODUCTDETAIL_TO_CART
		FOREIGN KEY (
			fk_productDetailId
		)
		REFERENCES PRODUCTDETAIL (
			productDetailId
		);
















--------------------------------------------------------
--  DDL for Sequence SEQ_ADDRESSBOOK
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ADDRESSBOOK"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_BATCHKEY
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_BATCHKEY"  MINVALUE 0 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_CART
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CART"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_CATEGORY
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_CATEGORY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_COUNTRY
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_COUNTRY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_FRAME
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FRAME"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_FRAMECOLOR
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FRAMECOLOR"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_LENSECOLOR
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_LENSECOLOR"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_MATERIAL
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MATERIAL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_MEMBER
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MEMBER"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_ORDER
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ORDER"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_ORDERDETAIL
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ORDERDETAIL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_PAYMENT
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PAYMENT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_PRODUCTDETAIL
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PRODUCTDETAIL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_PRODUCTDETAILIMAGE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PRODUCTDETAILIMAGE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_PRODUCTGROUP
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PRODUCTGROUP"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_STORE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_STORE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_STORECATEGORY
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_STORECATEGORY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_STOREDETAILIMAGE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_STOREDETAILIMAGE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_STYLE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_STYLE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_TEST
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_TEST"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
--------------------------------------------------------
--  DDL for Sequence SEQ_WISHLIST
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_WISHLIST"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL

















create or replace NONEDITIONABLE FUNCTION "ZBF_GET_BATCHKEY" (
    p_type in varchar2
) RETURN VARCHAR2
AS
     v_returnValue VARCHAR2(180);
BEGIN

    BEGIN

        select TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(SEQ_BATCHKEY.nextval, 5, 0) --currval�� �ٲٱ� ����
          into v_returnValue
          from dual;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_returnValue := ' ';
      WHEN OTHERS THEN
        v_returnValue := ' ';
    END;

    RETURN v_returnValue;
END;






create or replace NONEDITIONABLE PROCEDURE "SZP_BATCHKEY_RESET" (SEQ_NAME IN VARCHAR2)
IS
    L_VAL NUMBER;
BEGIN

    EXECUTE IMMEDIATE 'SELECT '|| SEQ_NAME ||'.NEXTVAL FROM DUAL' INTO L_VAL;

    EXECUTE IMMEDIATE 'ALTER SEQUENCE '|| SEQ_NAME ||' INCREMENT BY -'|| L_VAL ||' MINVALUE 0';

    EXECUTE IMMEDIATE 'SELECT '|| SEQ_NAME ||'.NEXTVAL FROM DUAL' INTO L_VAL;

    EXECUTE IMMEDIATE 'ALTER SEQUENCE '|| SEQ_NAME ||' INCREMENT BY 1 MINVALUE 0';

END;
