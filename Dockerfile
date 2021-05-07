FROM mcr.microsoft.com/dotnet/core/sdk:2.2
WORKDIR "/src"
RUN echo "$PWD"
COPY ["src/HotelReservationSystem/HotelReservationSystem.csproj", "HotelReservationSystem/"]
COPY ["src/HotelReservationSystemTypes/HotelReservationSystemTypes.csproj", "HotelReservationSystemTypes/"]
RUN dotnet restore "HotelReservationSystem/HotelReservationSystem.csproj"
COPY ./src .
WORKDIR "/src/HotelReservationSystem"
RUN dotnet build "HotelReservationSystem.csproj" -c Release -o /app
RUN dotnet publish "HotelReservationSystem.csproj" -c Release -o /app
EXPOSE 80
WORKDIR /app
ENTRYPOINT ["dotnet", "HotelReservationSystem.dll"]
