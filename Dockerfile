FROM scratch
ARG zerobin=zero64
ADD ${zerobin} /zero
CMD  [ "/zero" ]
