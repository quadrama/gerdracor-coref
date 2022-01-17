#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Splits acts from GerDraCor TEI with the act numbers given in the file name.
Act numbers should be given in the file name as ActN with N being the act number.
If there is no act number given in the file name, all acts are written
to separate files.

Example Usage:
    ./gdc_split_acts.py /path/to/corpus /outdir --addScenes
"""

import argparse
import copy
import os
import re
#import lxml.etree as ET

def parse_args():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument("CORPUS", type=str, help="Path to corpus files. Can also be a single file.")
    parser.add_argument("OUTDIR", type=str, help="Path to output directory.")
    parser.add_argument("--addScenes", action="store_true", help="Creates additional files that contain each a single scene from the given act.")
    args = parser.parse_args()
    return args

def split_act(tei_file, tei_name, act_num, args):

    act_regex = re.compile("type\s*=\s*['\"]act['\"]")
    scene_regex = re.compile("type\s*=\s*['\"]scene['\"]")
    div_begin_regex = re.compile("<div.*>")
    div_end_regex = re.compile("</div>")
    output = []

    tei = tei_file.read()

    if act_num == []:
        acts = re.findall(act_regex, tei)
        act_num = range(1, len(acts)+1)

    for actId in act_num:

        act_counter = 0
        div_counter = 0
        in_act = False
        act_wanted = False
        
        for l in tei.split("\n"):
            if re.search(act_regex, l):
                in_act = True
                act_counter += 1
                if act_counter == int(actId):
                    act_wanted = True
                else:
                    act_wanted = False
            if re.search(div_begin_regex, l):
                div_counter += 1
            elif re.search(div_end_regex, l):
                div_counter -= 1
            if not in_act:
                output.append(l)
            if div_counter != 0 and act_wanted:
                output.append(l)
            elif div_counter != 0 and not act_wanted:
                pass
            elif div_counter == 0:
                in_act = False

        tei_basename = os.path.basename(tei_name)
        tei_basename_new = re.split("[._]", tei_basename)[0] + "_Act" + str(actId)
        print("Writing "+args.OUTDIR + "/" + tei_basename_new + ".part.xml")
        with open(args.OUTDIR + "/" + tei_basename_new + ".part.xml", "w", encoding = 'utf-8') as file_w:
            file_w.write("\n".join(output))

        if args.addScenes:

            act_counter = 0
            div_counter = 0
            div_scene_counter = 0
            in_act = False
            in_scene = False
            act_wanted = False
            scene_wanted = False

            scene_num = 0
            scenes = re.findall(scene_regex,"".join(output))
            scene_num = range(1, len(scenes)+1)

            for sceneId in scene_num:
                output = []
                act_counter = 0
                scene_counter = 0
                for l in tei.split("\n"):
                    if div_counter == 0:
                        in_act = False
                    if div_scene_counter == 0:
                        in_scene = False
                    if re.search(act_regex, l):
                        in_act = True
                        act_counter += 1
                        scene_counter = 0
                        if act_counter == int(actId):
                            act_wanted = True
                        else:
                            act_wanted = False
                    if re.search(scene_regex, l):
                        in_scene = True
                        scene_counter += 1
                        div_scene_counter = 0
                        if scene_counter == int(sceneId):
                            scene_wanted = True
                        else:
                            scene_wanted = False
                    if re.search(div_begin_regex, l):
                        div_counter += 1
                    elif re.search(div_end_regex, l):
                        div_counter -= 1
                    if re.search(div_begin_regex, l) and in_scene:
                        div_scene_counter += 1
                    elif re.search(div_end_regex, l) and in_scene:
                        div_scene_counter -= 1
                    if not in_act and not in_scene:
                        output.append(l)
                    elif act_wanted and not in_scene:
                        output.append(l)
                    elif act_wanted and scene_wanted and in_scene:
                        output.append(l)
                    elif not act_wanted or not scene_wanted:
                        pass
                
                print("Writing " + args.OUTDIR + "/" + tei_basename_new + "_Scene" + str(sceneId) + ".part.xml")
                with open(args.OUTDIR + "/" + tei_basename_new + "_Scene" + str(sceneId) + ".part.xml", "w", encoding = 'utf-8') as file_w:
                    file_w.write("\n".join(output))
                output = []
        output = []

def main():
   
    args = parse_args()

    if os.path.isfile(args.CORPUS):
        all_files = [args.CORPUS]
    else:
        all_files = os.listdir(args.CORPUS)
        tmp = []
        for f in all_files:
            if os.path.isfile(args.CORPUS+"/"+f):
                tmp.append(args.CORPUS+"/"+f)
        all_files = tmp
    if len(all_files) == 1:
        print("Processing", len(all_files), "file.")
    else:
        print("Processing", len(all_files), "files.")

    for tei in all_files:
        act_num = re.findall("Act(\d)", tei)
        with open(tei, "r") as tei_file:
            split_act(tei_file, tei, act_num, args)

if __name__ == "__main__":
    main()
