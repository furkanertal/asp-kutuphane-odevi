<%@ Language=VBScript CodePage=65001 %>
<% Option Explicit %>
<%
If Session("Kutuphane") = "" Then
    Dim ornekVeri
    ornekVeri = "Tutunamayanlar;Oğuz Atay;1972;Roman" & "|" & _
                "1984;George Orwell;1950;Roman" & "|" & _
		"Dune;Frank Herbert;1965;Bilim" & "|" & _
		"Fahrenheit 451;Ray Bradbury;1953;Bilim" & "|" & _
		"Atomik Alışkanlıklar;James Clear;2018;Roman" &
    Session("Kutuphane") = ornekVeri
End If
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Kütüphane Otomasyonu</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <div class="menu">
            <a href="ekle.asp" class="btn" style="width:auto; display:inline-block; background:#27ae60;">+ Yeni Kitap Ekle</a>
        </div>
        
        <h2>📚 Kitap Arama</h2>
        <form action="ara.asp" method="post">
            <input type="text" name="txtArama" placeholder="Kitap veya Yazar Adı giriniz..." required>
            <input type="submit" value="KİTAP ARA">
        </form>
        
        <div style="margin-top: 30px; text-align: center; color: #888; font-size: 0.9em;">
            <p>Sistemde Kayıtlı Toplam Kitap: <strong><%= UBound(Split(Session("Kutuphane"), "|")) + 1 %></strong></p>
        </div>
    </div>

    <div style="position: fixed; bottom: 0; left: 0; width: 100%; background-color: #2c3e50; color: white; padding: 10px 0; font-family: 'Segoe UI', sans-serif; box-shadow: 0 -2px 10px rgba(0,0,0,0.2); z-index: 1000; display: flex; align-items: center; justify-content: center; gap: 15px;">
    
    <img src="kbu.png" alt="Karabük Üniversitesi" style="height: 50px; width: auto; background: white; border-radius: 5px; padding: 2px;">
    
    <div style="text-align: left;">
        <span style="font-size: 16px; font-weight: 600; display: block;">Muhammed Furkan Ertal</span>
        <span style="font-size: 13px; opacity: 0.8;">Sunucu Taraflı Programlama Proje Ödevi | 2025-2026 Güz Dönemi</span>
    </div>

</div>

</body>

</html>
