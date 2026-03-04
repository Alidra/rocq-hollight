FROM ocaml/opam:debian-12-ocaml-5.3
LABEL authors=Deducteam

RUN sudo apt update
RUN sudo apt install -y perl pkg-config libpcre2-dev m4 libgmp-dev libev-dev libssl-dev
# RUN git clone --depth 1 https://github.com/Alidra/rocq-hollight.git
COPY --chown=opam:opam . /home/opam/rocq-hollight
# RUN export HOLLIGHT_DIR=`pwd`/hol-light
# RUN export HOL2DK_DIR=`pwd`/hol2dk

WORKDIR $HOME/rocq-hollight
RUN ./reproduce Multivariate --only 2
RUN ./reproduce Multivariate --only 3
RUN ./reproduce Multivariate --only 4
RUN ./reproduce Multivariate --only 5
RUN ./reproduce Multivariate --only 6
RUN ./reproduce Multivariate --only 7
RUN ./reproduce Multivariate --only 8
RUN ./reproduce Multivariate --only 9

ENTRYPOINT ["./reproduce"]
CMD ["-y", "10"]