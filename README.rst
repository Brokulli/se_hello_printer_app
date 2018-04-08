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

  ::

    Status image z TravisCi

    Dodajemy badge z TravisCi (format to RST)

    .. image:: https://travis-ci.org/Brokulli/se_hello_printer_app.svg?branch=master
        :target: https://travis-ci.org/Brokulli/se_hello_printer_app

  .. image:: https://travis-ci.org/Brokulli/se_hello_printer_app.svg?branch=master
      :target: https://travis-ci.org/Brokulli/se_hello_printer_app


- Integracja z hub.docker.com

  ::


- Integracja z Heroku

  ::

    Tworzymy konto na heroku.
    Dodajemy gunicorn do pliku requirements.txt


- Integracja z Statuscake

  ::

    Tworzymy konto na statuscake.com
    Tworzymy nowy test aplikacji z haroku

  ::

    Dodajemy badge z Statuscake (wybieramy odpowiadający nam styl przycisku)
    Należy zmienić html na .RST

    html: <a href="https://www.statuscake.com" title="Website Uptime Monitoring"><img src="https://app.statuscake.com/button/index.php?Track=V8soudmD6X&Days=1&Design=2" /></a>

    RST: .. image:: https://app.statuscake.com/button/index.php?Track=V8soudmD6X&Days=1&Design=2
        :target: https://www.statuscake.com

  .. image:: https://app.statuscake.com/button/index.php?Track=V8soudmD6X&Days=1&Design=2
      :target: https://www.statuscake.com

- Diagram

  ::

    diagram w folderze docs

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
