#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed May 13 03:05:56 2020

@author: faizabbas
"""
import speech_recognition as sr
import pyaudio
import random
import keyboard as kb

import os
import time
import pyttsx3
import webbrowser as wb
from time import ctime


r = sr.Recognizer()
def record_audio(ask = False):
    if ask:
        print(ask)
    with sr.Microphone() as source:
        print("Speak Anything :")
        audio = r.listen(source)
        voice_data = ''

    try:
        text = r.recognize_google(audio)
        print("You said : {}".format(voice_data))

        if text == ("play music"):
            music = random.choice(["youtube.com/watch?v=1CurN2Fg-2E","youtube.com/watch?v=y8OtzJtp-EM","youtube.com/watch?v=PT2_F-1esPk"])
            visit = "https://{}".format(music)
            wb.open(visit)
        elif text == ("how are you feeling"):
            engine = pyttsx3.init()
            engine.say("I'm beginning to feel like a Rap God, Rap God All my people from the front to the back nod, back nod Now who thinks their arms are long enough to slap box, slap box? They said I rap like a robot, so call me Rapbot")
            engine.runAndWait()
        else:
            if text == (" tell me a joke"):
                joke =("What does the sign on an out-of-business brothel say? Beat it. We are closed",)
                random.choice(joke)




    except:
        print("wtf did you say you slag?")
    return voice_data
def respond(voice_data):
    if 'what is in your name' in voice_data:
        print('my name is thor')
    if 'what is the time' in voice_data:
        print(ctime)
    if 'search' in voice_data:
        search = record_audio("what are you looking for")
        url = 'https://www.google.com/search?q=' + search
        wb.get().open(url)
        print('found this '+ search)
    if 'find location' in voice_data:
        location = record_audio('what is the location')
        url = 'https://www.google.nl/maps/place' + location +'/%amp;'
        wb.get().open(url)
        print('here is the location '+ search)
    if 'exit' in voice_data:
        exit()


print('how can i help you?')

voice_data = record_audio()
respond(voice_data)
