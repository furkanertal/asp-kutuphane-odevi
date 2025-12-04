<%@ Language=VBScript CodePage=65001 %>
<% Option Explicit %>
<%
Dim ad, yazar, yil, tur, yeniKayit, hataMesaji
hataMesaji = ""

' Verileri al
ad = Request.Form("ad")
yazar = Request.Form("yazar")
yil = Request.Form("yil")
tur = Request.Form("tur")

' Replace kullanımı: Veri yapısını bozan karakterleri temizle
ad = Replace(ad, ";", "")
ad = Replace(ad, "|", "")
yazar = Replace(yazar, ";", "")

' Validasyonlar (Karar Yapıları)
If ad = "" Then
    hataMesaji = "Kitap adı boş olamaz."
ElseIf Len(yazar) < 4 Then
    hataMesaji = "Yazar adı en az 4 karakter olmalıdır."
ElseIf Not IsNumeric(yil) Then
    hataMesaji = "Yıl sayısal olmalıdır."
ElseIf CInt(yil) < 1950 OR CInt(yil) > 2025 Then
    hataMesaji = "Yıl 1950 ile 2025 arasında olmalıdır."
End If

If hataMesaji <> "" Then
    ' Hata varsa geri gönder
    Response.Write "<script>alert('" & hataMesaji & "'); window.history.back();</script>"
Else
    ' Hata yoksa string oluştur
    yeniKayit = ad & ";" & yazar & ";" & yil & ";" & tur
    
    ' Diziye ekle (Session stringinin sonuna ekleme)
    If Session("Kutuphane") = "" Then
        Session("Kutuphane") = yeniKayit
    Else
        Session("Kutuphane") = Session("Kutuphane") & "|" & yeniKayit
    End If
    
    Response.Write "<script>alert('Kitap kutuphaneye eklendi.'); window.location.href='index.asp';</script>"
End If
%>