FROM danteev/texlive:latest

WORKDIR /root

COPY modules /usr/local/share/texmf/tex/latex/

COPY entrypoint.sh /root/

ENTRYPOINT ["/root/entrypoint.sh"]
