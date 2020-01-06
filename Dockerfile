FROM danteev/texlive:latest

WORKDIR /root

COPY lib /github/home/texmf/tex/latex/

COPY lib /usr/local/share/texmf/
COPY lib /usr/local/share/texmf/tex/latex/
COPY lib /usr/local/share/texmf/tex/latex/local/

COPY entrypoint.sh /root/

ENTRYPOINT ["/root/entrypoint.sh"]
