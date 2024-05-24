FROM ubuntu:latest

# Установка X11 и Openbox
RUN apt-get update && apt-get install -y \
    x11-apps \
    openbox \
    x11-xserver-utils \
    && rm -rf /var/lib/apt/lists/*

# Настройка среды окружения
ENV DISPLAY=:0

# Запуск Openbox
CMD ["openbox"]

