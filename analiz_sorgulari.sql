-- ============================================================
-- Salon Randevu Veritabanı — Örnek Analitik Sorgular
-- Veritabanı: mirayhil_hairstudio
-- ============================================================

-- 1) En çok tercih edilen işlemler (randevu sayısına göre)
SELECT i.islem_adi,
       COUNT(*) AS randevu_sayisi
FROM randevular r
JOIN islemler i ON r.islem_id = i.islem_id
GROUP BY i.islem_adi
ORDER BY randevu_sayisi DESC;

-- 2) Güne göre randevu yoğunluğu (hangi gün kaç randevu)
SELECT randevu_tarihi,
       COUNT(*) AS randevu_sayisi
FROM randevular
GROUP BY randevu_tarihi
ORDER BY randevu_tarihi;

-- 3) Personel başına toplam gelir (yalnızca tamamlanan randevular)
SELECT p.personel_ad_soyad,
       SUM(i.islem_fiyati) AS toplam_gelir
FROM randevular r
JOIN personel p ON r.personel_id = p.personel_id
JOIN islemler i ON r.islem_id = i.islem_id
WHERE r.durum = 'tamamlandı'
GROUP BY p.personel_ad_soyad
ORDER BY toplam_gelir DESC;

-- 4) Randevu durumlarının dağılımı (bekliyor / tamamlandı / iptal)
SELECT durum,
       COUNT(*) AS adet
FROM randevular
GROUP BY durum;

-- 5) Her müşterinin aldığı randevu sayısı
--    (hiç randevusu olmayan müşteriler de görünsün diye LEFT JOIN)
SELECT m.musteri_ad_soyad,
       COUNT(r.randevu_id) AS randevu_sayisi
FROM musteriler m
LEFT JOIN randevular r ON m.musteri_id = r.musteri_id
GROUP BY m.musteri_ad_soyad
ORDER BY randevu_sayisi DESC;

-- 6) İşlem bazında toplam ciro (tamamlanan randevulardan)
SELECT i.islem_adi,
       COUNT(*) AS adet,
       SUM(i.islem_fiyati) AS toplam_ciro
FROM randevular r
JOIN islemler i ON r.islem_id = i.islem_id
WHERE r.durum = 'tamamlandı'
GROUP BY i.islem_adi
ORDER BY toplam_ciro DESC;
