FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["RailwayDemoApi/RailwayDemoApi.csproj", "RailwayDemoApi/"]
RUN dotnet restore "RailwayDemoApi/RailwayDemoApi.csproj"

COPY . .
WORKDIR /src/RailwayDemoApi
RUN dotnet publish "RailwayDemoApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 8080
ENTRYPOINT ["sh", "-c", "dotnet RailwayDemoApi.dll --urls=http://0.0.0.0:${PORT:-8080}"]
