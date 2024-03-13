## Docker-команда FROM вказує базовий образ контейнера
## Наш базовий образ - це Linux з попередньо встановленим python-3.10
#FROM python:3.10
#
## Встановлення pipenv
#RUN pip install pipenv
#
## Встановимо змінну середовища
#ENV APP_HOME /app
#
## Встановимо робочу директорію всередині контейнера
##WORKDIR $APP_HOME
#
## Скопіюємо інші файли в робочу директорію контейнера
#COPY . .
#
## Встановимо залежності всередині контейнера
##RUN pip install -r requirements.txt
##RUN pip install pipenv
##RUN pipenv install
#RUN pipenv install --deploy --ignore-pipfile
#
## Позначимо порт, де працює застосунок всередині контейнера
##EXPOSE 5000
#
## Запустимо наш застосунок всередині контейнера
##ENTRYPOINT ["python", "hw.py"]
#
## Вказуємо команду для запуску застосунку
#CMD ["pipenv", "run", "python", "your_application.py"]

FROM python:3.10

# Встановимо змінну середовища
ENV APP_HOME /app

# Створюємо директорію для застосунку
WORKDIR /usr/src/app

# Копіюємо всі файли проекту в контейнер
COPY . .

# Встановлюємо залежності
#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt
COPY Pipfile ./
RUN pip install pipenv
RUN pipenv install --deploy --ignore-pipfile



# Вказуємо команду для запуску застосунку
CMD ["python", "hw.py"]

# Команди для Docker:
# 1. Побудова образу Docker (docker build -t {Назва образу(придумай сам)} .)
# docker build -t personal-assistant .
#2. Запуск контейнера (docker run -it {Назва побудованого образу})
# docker run -it personal-assistant
# docker run -it --name {myapp} {my-app}
# Ця команда створить і запустить контейнер з іменем myapp з образу my-app в інтерактивному режимі з текстовим інтерфейсом користувача
# 3. Якщо контейнер був зупинений: (docker start -i {назва контейнеру})
# docker start -i goit-pyweb-hw-02
