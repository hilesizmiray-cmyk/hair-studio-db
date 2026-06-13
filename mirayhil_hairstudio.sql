-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 13 Haz 2026, 02:31:07
-- Sunucu sürümü: 10.6.27-MariaDB
-- PHP Sürümü: 8.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `mirayhil_hairstudio`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `islemler`
--

CREATE TABLE `islemler` (
  `islem_id` int(11) NOT NULL,
  `islem_adi` varchar(100) NOT NULL,
  `islem_fiyati` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `islemler`
--

INSERT INTO `islemler` (`islem_id`, `islem_adi`, `islem_fiyati`) VALUES
(1, 'Saç Kesimi', 400.00),
(2, 'Fön & Şekillendirme', 300.00),
(3, 'Saç Boyama', 1200.00),
(4, 'Ombre / Balayage', 2500.00),
(5, 'Keratin Bakımı', 1800.00),
(6, 'Saç Botoksu', 1500.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteriler`
--

CREATE TABLE `musteriler` (
  `musteri_id` int(11) NOT NULL,
  `musteri_ad_soyad` varchar(100) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `gmail` varchar(100) DEFAULT NULL,
  `cinsiyet` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `musteriler`
--

INSERT INTO `musteriler` (`musteri_id`, `musteri_ad_soyad`, `telefon`, `gmail`, `cinsiyet`) VALUES
(1, 'Zeynep Kaya', '0541 234 5678', 'zeynep.kaya@example.com', 'Kadın'),
(2, 'Mehmet Demir', '0542 345 6789', 'mehmet.demir@example.com', 'Erkek'),
(3, 'Selin Arslan', '0543 456 7890', 'selin.arslan@example.com', 'Kadın'),
(4, 'Burak Şahin', '0544 567 8901', 'burak.sahin@example.com', 'Erkek'),
(5, 'Deniz Yıldız', '0545 678 9012', 'deniz.yildiz@example.com', 'Kadın');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel`
--

CREATE TABLE `personel` (
  `personel_id` int(11) NOT NULL,
  `personel_ad_soyad` varchar(100) NOT NULL,
  `personel_telefon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `personel`
--

INSERT INTO `personel` (`personel_id`, `personel_ad_soyad`, `personel_telefon`) VALUES
(1, 'Elif Demir', '0532 111 2233'),
(2, 'Ahmet Yılmaz', '0533 444 5566'),
(3, 'Ayşe Çelik', '0535 777 8899');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `randevular`
--

CREATE TABLE `randevular` (
  `randevu_id` int(11) NOT NULL,
  `musteri_id` int(11) DEFAULT NULL,
  `personel_id` int(11) DEFAULT NULL,
  `islem_id` int(11) DEFAULT NULL,
  `randevu_tarihi` date NOT NULL DEFAULT '2026-01-01',
  `randevu_saati` time NOT NULL DEFAULT '10:00:00',
  `durum` varchar(20) NOT NULL DEFAULT 'bekliyor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `randevular`
--

INSERT INTO `randevular` (`randevu_id`, `musteri_id`, `personel_id`, `islem_id`, `randevu_tarihi`, `randevu_saati`, `durum`) VALUES
(1, 1, 1, 3, '2026-06-15', '10:00:00', 'tamamlandı'),
(2, 2, 2, 1, '2026-06-15', '11:30:00', 'tamamlandı'),
(3, 3, 1, 4, '2026-06-16', '14:00:00', 'bekliyor'),
(4, 4, 3, 2, '2026-06-17', '09:30:00', 'bekliyor'),
(5, 5, 2, 5, '2026-06-17', '16:00:00', 'iptal'),
(6, 1, 3, 6, '2026-06-18', '13:00:00', 'bekliyor');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `islemler`
--
ALTER TABLE `islemler`
  ADD PRIMARY KEY (`islem_id`);

--
-- Tablo için indeksler `musteriler`
--
ALTER TABLE `musteriler`
  ADD PRIMARY KEY (`musteri_id`);

--
-- Tablo için indeksler `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`personel_id`);

--
-- Tablo için indeksler `randevular`
--
ALTER TABLE `randevular`
  ADD PRIMARY KEY (`randevu_id`),
  ADD KEY `fk_randevu_musteri` (`musteri_id`),
  ADD KEY `fk_randevu_personel` (`personel_id`),
  ADD KEY `fk_randevu_islem` (`islem_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `islemler`
--
ALTER TABLE `islemler`
  MODIFY `islem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `musteriler`
--
ALTER TABLE `musteriler`
  MODIFY `musteri_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `personel`
--
ALTER TABLE `personel`
  MODIFY `personel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `randevular`
--
ALTER TABLE `randevular`
  MODIFY `randevu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `randevular`
--
ALTER TABLE `randevular`
  ADD CONSTRAINT `fk_randevu_islem` FOREIGN KEY (`islem_id`) REFERENCES `islemler` (`islem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_randevu_musteri` FOREIGN KEY (`musteri_id`) REFERENCES `musteriler` (`musteri_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_randevu_personel` FOREIGN KEY (`personel_id`) REFERENCES `personel` (`personel_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
