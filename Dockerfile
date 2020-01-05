FROM danteev/texlive:latest

WORKDIR /root

COPY lib /root/texmf/tex/latex/

COPY entrypoint.sh /root/

ENTRYPOINT ["/root/entrypoint.sh"]
