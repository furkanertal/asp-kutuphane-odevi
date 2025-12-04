<%@ Language=VBScript CodePage=65001 %>
<% Option Explicit %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Arama Sonuçları</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
    <h3>🔍 Arama Sonuçları</h3>
    <div class="menu"><a href="index.asp">Ana Sayfaya Dön</a></div>
    
    <%
    Dim aranan, tumVeri, kitaplar, i, kitapDetay, bulunanSayisi, kitapAdi, yazarAdi
    aranan = Lcase(Request.Form("txtArama"))
    
    If Session("Kutuphane") <> "" Then
        tumVeri = Session("Kutuphane")
        kitaplar = Split(tumVeri, "|")
        
        Response.Write "<table><thead><tr><th>Kitap Adı</th><th>Yazar</th><th>Yıl</th><th>İşlemler</th></tr></thead><tbody>"
        bulunanSayisi = 0
        
        For i = 0 To UBound(kitaplar)
            kitapDetay = Split(kitaplar(i), ";")
            kitapAdi = Lcase(kitapDetay(0))
            yazarAdi = Lcase(kitapDetay(1))
            
            If Instr(kitapAdi, aranan) > 0 OR Instr(yazarAdi, aranan) > 0 Then
                bulunanSayisi = bulunanSayisi + 1
                %>
                <tr>
                    <td><%= kitapDetay(0) %></td>
                    <td><%= kitapDetay(1) %></td>
                    <td><%= kitapDetay(2) %></td>
                    <td>
                        <a href="detay.asp?id=<%=i%>" class="btn-detay">İncele</a> &nbsp;|&nbsp; 
                        <a href="sil.asp?id=<%=i%>" class="btn-sil" onclick="return confirm('Bu kitabı silmek istediğinize emin misiniz?');">Sil</a>
                    </td>
                </tr>
                <%
            End If
        Next
        Response.Write "</tbody></table>"
        
        If bulunanSayisi = 0 Then
            Response.Write "<div style='padding:20px; text-align:center; color:#e74c3c;'>Aradığınız kriterlere uygun kayıt bulunamadı.</div>"
        End If
    Else
        Response.Write "<p>Sistemde kayıtlı kitap yok.</p>"
    End If
    %>
</div>
</body>
</html>		