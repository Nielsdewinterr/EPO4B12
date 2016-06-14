clear all;
close all;

Connect;
init

EPOCommunications('transmit','A1');
inputbuffer = audio_recieve;
EPOCommunications('transmit','A0');

EPOCommunications('close');
input('saved all?')
