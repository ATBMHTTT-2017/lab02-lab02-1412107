--connect as sysadmin
----------------------------------1. create tables------------------------------------
--1. PHONGBAN
Create table PHONGBAN_1412107_1412004(
	MAPHG varchar2(15) not null,
	TENPHG nvarchar2(30),
	TRPHG varchar2(15),
  NG_NHANCHUC date,
	soNhanVien int, 
  chiNhanh varchar2(15),
	constraint PK_PHONGBAN primary key (MAPHG)
);

--2. NHANVIEN
Create table NHANVIEN_1412107_1412004(
	MANV varchar2(15) not null,
	HOTEN nvarchar2(50),
  diaChi varchar2(50),
  dienThoai varchar2(15),
  email nvarchar2(50),
  MAPHG varchar2(15),
  chiNhanh varchar2(15),
	LUONG float,
  MATKHAU varchar2(15),
	constraint PK_NHANVIEN primary key (MANV)
);

--3. CHINHANH
Create table CHINHANH_1412107_1412004(
  maCN varchar2(15) null,
  tenCN nvarchar2(50),
  truongChiNhanh varchar2(15),
  constraint PK_CHINHANH primary key (maCN)
);

--4. DUAN
Create table DUAN(
  maDA varchar2(15) not null,
  tenDA nvarchar2(50),
  kinhPhi float,
  phongChuTri varchar2(15),
  truongDA varchar2(15),
  constraint PK_DUAN primary key (maDA)
);

--5. CHITIEU
Create table CHITIEU_1412107_1412004(
  maChiTieu varchar2(15) not null,
  tenChiTieu nvarchar2(50),
  soTien float,
  duAn varchar2(15),
  constraint PK_CHITIEU primary key (maChiTieu)
);
--6. PHANCONG
Create table PHANCONG_1412107_1412004(
  MANV varchar2(15) not null,
  maDA varchar2(15) not null,
  vaiTro nvarchar2(50),
  phuCap float,
  constraint PK_PHANCONG primary key (MANV, maDA)
);


-------------------------------2. create foreign key------------------------------------------
--1. PHONGBAN
Alter table PHONGBAN add(
constraint FK_PHONGBAN_NHANVIEN_1412107_1412004 foreign key(TRPHG) references NHANVIEN(MANV),
constraint FK_PHONGBAN_CHINHANH_1412107_1412004 foreign key(chiNhanh) references CHINHANH(maCN)
);

--2. NHANVIEN
Alter table NHANVIEN add(
constraint FK_NHANVIEN_PHONGBAN_1412107_1412004 foreign key(MAPHG) references PHONGBAN(MAPHG),
constraint FK_NHANVIEN_CHINHANH_1412107_1412004 foreign key(chiNhanh) references CHINHANH(maCN)
);

--3. CHINHANH
Alter table CHINHANH add(
constraint FK_CHINHANH_NHANVIEN_1412107_1412004 foreign key(truongChiNhanh) references NHANVIEN(MANV)
);

--4. DUAN
Alter table DUAN add(
constraint FK_DUAN_PHONGBAN_1412107_1412004 foreign key (phongChuTri) references PHONGBAN(MAPHG),
constraint FK_DUAN_NHANVIEN_1412107_1412004 foreign key (truongDA) references NHANVIEN(MANV)
);

--5. CHITIEU
Alter table CHITIEU add(
constraint FK_CHITIEU_DUAN_1412107_1412004 foreign key(duAn) references DUAN(maDA)
);

--6. PHANCONG
Alter table PHANCONG add(
constraint FK_PHANCONG_DUAN_1412107_1412004 foreign key(maDA) references DUAN(maDA),
constraint FK_PHANCONG_NHANVIEN_1412107_1412004 foreign key(MANV) references NHANVIEN(MANV)
);


