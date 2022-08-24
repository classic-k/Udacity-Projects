import fs from "fs";
import { Request, Response } from "express";
import Jimp = require("jimp");
import path from "path";

// filterImageFromURL
// helper function to download, filter, and save the filtered image locally
// returns the absolute path to the local image
// INPUTS
//    inputURL: string - a publicly accessible url to an image file
// RETURNS
//    an absolute path to a filtered image locally saved file
export async function filterImageFromURL(inputURL: string): Promise<string> {
  return new Promise(async (resolve, reject) => {
    try {
      const photo = await Jimp.read(inputURL);
      const outpath = path.join(
        "tmp",
        "filtered." + Math.floor(Math.random() * 2000) + ".jpg"
      );

      await photo
        .resize(256, 256) // resize
        .quality(60) // set JPEG quality
        .greyscale() // set greyscale
        .write(path.join(__dirname, "..", outpath), (img) => {
          resolve(path.join(__dirname, "..", outpath));
        });
    } catch (error) {
      reject(error);
    }
  });
}

// deleteLocalFiles
// helper function to delete files on the local disk
// useful to cleanup after tasks
// INPUTS
//    files: Array<string> an array of absolute paths to files
export async function deleteLocalFiles(files: Array<string>) {
  for (let file of files) {
    console.log(file);
    fs.unlinkSync(file);
  }
}
export function listdir(folder: string): Array<string> {
  let l = fs.readdir(folder, (err, files) => {
    let lst = [];
    for (let file of files) {
      lst.push(path.join(folder, file));
    }
    return lst;
  });
  console.log(l);
  return [];
}
export function vetUrl(url: string): boolean {
  const pattern = /http|https:\/\/(www\.)?[a-zA-Z0-9.]+\.[a-zA-Z0-9]+\/\w+/i; ///http|https:\/\/(www\.)?[a-zA-Z0-9.]+\.[a-zA-Z0-9]+\/\w+/i;

  return pattern.test(url); //&& url.endsWith(".jpg");
}

export const apiKey = (req: Request, res: Response, next: () => any) => {
  const key = req.headers["x-api-key"];
  console.log(req.headers);
  console.log(key);
  if (!key || key !== "sk_cloudtravel") {
    return res.status(401).send("Unauthorized");
  }
  next();
};
