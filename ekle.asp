<%@ Language=VBScript CodePage=65001 %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Kitap Ekle</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container" style="max-width: 500px;">
    <h2>📖 Yeni Kitap Ekle</h2>
    <form action="eklekaydet.asp" method="post">
        
        <span class="label-title">Kitap Adı</span>
        <input type="text" name="ad" placeholder="Kitap adı giriniz..." required>
        
        <span class="label-title">Yazar Adı (En az 4 karakter)</span>
        <input type="text" name="yazar" placeholder="Yazar adı giriniz..." required>
        
        <span class="label-title">Basım Yılı (1950 - 2025)</span>
        <input type="number" name="yil" min="1950" max="2025" value="2025" required>
        
        <span class="label-title">Tür</span>
        <select name="tur">
            <option value="Roman">Roman</option>
            <option value="Bilim">Bilim</option>
            <option value="Tarih">Tarih</option>
            <option value="Kişisel Gelişim">Kişisel Gelişim</option>
            <option value="Diğer">Diğer</option>
        </select>
        
        <button type="submit" style="background-color: #27ae60;">Kaydet</button>
        <div style="text-align:center; margin-top:15px;">
            <a href="index.asp" style="color:#7f8c8d;">İptal</a>
        </div>
    </form>
</div>
</body>
</html>