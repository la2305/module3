CREATE DATABASE xuat_nhap_khau;
use xuat_nhap_khau;
CREATE TABLE phieu_xuat (
    so_phieu_xuat VARCHAR(50) PRIMARY KEY,
    ngay_xuat DATETIME
);
CREATE TABLE vat_tu (
    ma_vat_tu VARCHAR(50) PRIMARY KEY,
    ten_vat_tu VARCHAR(50)
);
CREATE TABLE chi_tiet_phieu_xuat (
    don_gia_xuat INT,
    so_luong_xuat INT,
    so_phieu_xuat VARCHAR(50),
    ma_vat_tu VARCHAR(50),
    PRIMARY KEY (so_phieu_xuat , ma_vat_tu),
    FOREIGN KEY (so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);
CREATE TABLE phieu_nhap (
    so_phieu_nhap VARCHAR(50) PRIMARY KEY,
    ngay_nhap DATETIME
);
CREATE TABLE chi_tiet_phieu_nhap (
    don_gia_nhap INT,
    so_luong_nhap INT,
    so_phieu_nhap VARCHAR(50),
    ma_vat_tu VARCHAR(50),
    PRIMARY KEY (ma_vat_tu , so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap)
);
CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap VARCHAR(50) PRIMARY KEY,
    ten_nha_cung_cap VARCHAR(50),
    dia_chi VARCHAR(50)
);
CREATE TABLE don_dat_hang (
    so_dat_hang VARCHAR(50) PRIMARY KEY,
    ngay_dat_hang DATETIME,
    ma_nha_cung_cap VARCHAR(50),
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);
CREATE TABLE chi_tiet_don_dat_hang (
    ma_vat_tu VARCHAR(50),
    so_don_hang VARCHAR(50),
    PRIMARY KEY (ma_vat_tu , so_don_hang),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_don_hang)
        REFERENCES don_dat_hang (so_dat_hang)
);

CREATE TABLE so_dien_thoai (
    so_dien_thoai VARCHAR(50),
    ma_nha_cung_cap VARCHAR(50),
    FOREIGN KEY (so_dien_thoai)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);