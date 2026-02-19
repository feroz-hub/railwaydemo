FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

COPY ["RailwayDemoApi.csproj", "./"]
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app .
# Railway provides a PORT variable, we must listen on it
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080
ENTRYPOINT ["dotnet", "RailwayDemoApi.dll"]