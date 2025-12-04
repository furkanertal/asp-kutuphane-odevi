<%@ Language=VBScript CodePage=65001 %>
<% Option Explicit %>
<%
Dim id, kitaplar, i, yeniVeri
id = Request.QueryString("id")

If id <> "" AND IsNumeric(id) Then
    ' Veriyi diziye al
    kitaplar = Split(Session("Kutuphane"), "|")
    yeniVeri = ""
    
    ' Döngü ile gez, silinecek ID'yi atla
    For i = 0 To UBound(kitaplar)
        If CStr(i) <> CStr(id) Then
            If yeniVeri = "" Then
                yeniVeri = kitaplar(i)
            Else
                yeniVeri = yeniVeri & "|" & kitaplar(i)
            End If
        End If
    Next
    
    ' Session'ı güncelle
    Session("Kutuphane") = yeniVeri
    
    Response.Redirect "index.asp"
Else
    Response.Write "Hata: Silinecek kayıt bulunamadı."
End If
%>