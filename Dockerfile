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

FROM selenium/standalone-chrome:latest

# Установка дополнительных зависимостей (при необходимости)
RUN apt-get update && apt-get install -y \
    vim \
    git \
    && rm -rf /var/lib/apt/lists/*

# Копирование вашего кода в контейнер
COPY . /app
WORKDIR /app

# Выполнение скрипта для запуска вашего теста
CMD ["python", "test_google.py"]
