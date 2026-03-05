FROM ocaml/opam:debian-12-ocaml-5.3
LABEL authors=Deducteam

RUN sudo apt update
RUN sudo apt install -y perl pkg-config libpcre2-dev m4 libgmp-dev libev-dev libssl-dev
# RUN git clone --depth 1 https://github.com/Alidra/rocq-hollight.git
COPY --chown=opam:opam . /home/opam/rocq-hollight
# RUN export HOLLIGHT_DIR=`pwd`/hol-light
# RUN export HOL2DK_DIR=`pwd`/hol2dk

WORKDIR $HOME/rocq-hollight
# Actually, it does not matter wether to reproduce stages 1 to 8 for HOL or another library
RUN ./reproduce HOL --only 2
RUN ./reproduce HOL --only 3
RUN ./reproduce HOL --only 4
RUN ./reproduce HOL --only 5
RUN ./reproduce HOL --only 6
RUN ./reproduce HOL --only 7
RUN ./reproduce HOL --only 8

ENTRYPOINT ["./reproduce"]
CMD ["HOL", "9"]