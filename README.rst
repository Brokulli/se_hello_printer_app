Simple Flask App
================

Aplikacja Dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć
o Continuous Integration, Continuous Delivery i Continuous Deployment.

- Rozpocząnając pracę z projektem (wykorzystując virtualenv) musimy przygotować maszynę. Hermetyczne środowisko dla pojedyńczej aplikacji w python-ie:

  ::

    # na koniec ~/.bashrc wklejamy
    source /usr/bin/virtualenvwrapper.sh

    # jeśli nie działa to wcześniej instalujemy python virtualenv itd. (patrz: zakładka pomocnicze)

    # następnie jako root instalujemy
    mkvirtualenv wsb-simple-flask-app # na su nie działało, ale na zwyklym poszło
    pip install -r requirements.txt
    pip install -r test_requirements.txt

- Uruchamianie applikacji:

  ::

    # jako zwykły program
    python main.py

    # albo:
    PYTHONPATH=. FLASK_APP=hello_world flask run

- Uruchamianie testów (see: http://doc.pytest.org/en/latest/capture.html):

  ::

    PYTHONPATH=. py.test
    PYTHONPATH=. py.test  --verbose -s

- Przy ponownym uruchomieniu terminala; kontynuując pracę z projektem, aktywowanie hermetycznego środowiska dla aplikacji py:

  ::

    source /usr/bin/virtualenvwrapper.sh
    workon wsb-simple-flask-app


- Integracja z TravisCI:

  ::
    Tworzymy konto na travist.org, integrujemy z githubem.
    Tworzymy plik .travis.yml

    ...


Pomocnicze
==========

- Instalacja python virtualenv i virtualenvwrapper (na su):

  ::

    yum install python-pip
    pip install -U pip
    pip install virtualenv
    pip install virtualenvwrapper

- Instalacja docker-a:

  ::

    yum remove docker \
        docker-common \
        container-selinux \
        docker-selinux \
        docker-engine

    yum install -y yum-utils

    yum-config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo

    yum makecache fast
    yum install docker-ce
    systemctl start docker

  - Komendy - terminal - linux

    ::

      make test
      make lint
      make deps
      make run

    ::

      wychodzenie z su: exit
      

Materiały
=========

- https://virtualenvwrapper.readthedocs.io/en/latest/
