# Base alınacak Image'ların url'ini veriyoruz. 
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env

# App diye klasör, ben bu App'in içinde çalışacağım.
WORKDIR /app
# 1. nokta, solution'da olan tüm dosyaları, 2. noktada olan yani Container'ın içi oluyor. Alıp kopyalıyoruz.
COPY . .

# Release al (out dizinine çıkarır.)
RUN dotnet publish -c Release --property:PublishDir=/out

# Runtime image (Publish yok, derleyemem ama artık çalıştırırım.)
FROM mcr.microsoft.com/dotnet/aspnet:7.0

# App diye klasör açıyoruz.
WORKDIR /app

# Yukarıda Allianse olarak tanımladığımız noktadaki (out'daki) tüm dosyaları alıp, üstte açtığımız App'in (nokta) içine kopyala diyoruz.
COPY --from=build-env /out .

# Bu Image'ın çalışacağı ilgili DLL'i veriyoruz.
ENTRYPOINT dotnet coreapi.dll