<%@ Language=VBScript CodePage=65001 %>
<% Option Explicit %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Kitap Detayı</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container" style="max-width:500px; margin-top: 50px;">
    <h3>📖 Kitap Detay Kartı</h3>
    
    <%
    Dim id, kitaplar, secilenKitap, p1, p2, p3
    Dim kAd, kYazar, kYil, kTur
    
    ' Linkten gelen ID numarasını al (Örn: detay.asp?id=1)
    id = Request.QueryString("id")
    
    ' ID boş değilse ve sayıysa işlem yap
    If id <> "" AND IsNumeric(id) Then
        
        ' Verileri çek
        If Session("Kutuphane") <> "" Then
            kitaplar = Split(Session("Kutuphane"), "|")
            
            ' Gelen ID, mevcut kitap sayısından küçük veya eşit mi?
            If CInt(id) >= 0 AND CInt(id) <= UBound(kitaplar) Then
                secilenKitap = kitaplar(id)
                
                ' --- ÖDEV İÇİN STRİNG PARÇALAMA ALANI ---
                ' Veri Formatı: KitapAdi;Yazar;Yıl;Tür
                
                ' 1. Noktalı virgülün yerini bul
                p1 = Instr(secilenKitap, ";")
                ' Left ile baştan p1'e kadar olanı al (KİTAP ADI)
                kAd = Left(secilenKitap, p1 - 1)
                
                ' 2. Noktalı virgülün yerini bul
                p2 = Instr(p1 + 1, secilenKitap, ";")
                ' Mid ile aradaki metni al (YAZAR)
                kYazar = Mid(secilenKitap, p1 + 1, p2 - p1 - 1)
                
                ' 3. Noktalı virgülün yerini bul
                p3 = Instr(p2 + 1, secilenKitap, ";")
                ' Mid ile aradaki metni al (YIL)
                kYil = Mid(secilenKitap, p2 + 1, p3 - p2 - 1)
                
                ' Sonuncusu için Mid'in sonuna kadar gitmesi yeterli (TÜR)
                kTur = Mid(secilenKitap, p3 + 1)
                ' ---------------------------------------
                
                %>
                <div style="background:#f9f9f9; padding:20px; border-radius:10px; border:1px solid #ddd;">
                    <p><strong style="color:#2c3e50;">Kitap Adı:</strong> <br> <span style="font-size:1.2em; color:#e67e22;"><%= kAd %></span></p>
                    <p><strong>Yazar:</strong> <%= kYazar %></p>
                    <p><strong>Basım Yılı:</strong> <span style="background:#ddd; padding:2px 6px; border-radius:4px;"><%= kYil %></span></p>
                    <p><strong>Tür:</strong> <%= kTur %></p>
                </div>
                
                <br>
                <div style="text-align:center;">
                    <a href="javascript:history.back()" class="btn" style="background-color:#7f8c8d; width:auto; display:inline-block;">geri Dön</a>
                </div>
                <%
            Else
                Response.Write "<p style='color:red; text-align:center;'>HATA: Bu ID numarasına ait kitap bulunamadı.</p>"
            End If
        Else
            Response.Write "<p>Oturum zaman aşımına uğramış. Lütfen ana sayfaya dönün.</p>"
        End If
    Else
        Response.Write "<p style='color:red;'>Geçersiz parametre.</p>"
    End If
    %>
</div>
</body>
</html>