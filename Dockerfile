FROM danteev/texlive:latest

WORKDIR /root

COPY lib /github/home/texmf/tex/latex/

COPY lib /usr/local/share/texmf/tex/latex/

COPY entrypoint.sh /root/

ENTRYPOINT ["/root/entrypoint.sh"]
