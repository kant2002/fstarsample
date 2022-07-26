// For more information see https://aka.ms/fsharp-console-apps
open Huffman
open FStar_IO

let encoding = [('A', 2); ('E',5); ('F',1); ('H',1); ('I',1); ('L', 1);
   ('N',1); ('R',1); ('S',2); ('T',3); ('U',1); (' ',2)];
let t = huffman (List.map (fun (c,n: int) -> (c, Prims.pos n)) encoding);;

let sourceArray = "THE ESSENTIAL FEATURE"  |> List.ofSeq ;;

let encodedData = encode t sourceArray;;
let decodedData = match encodedData with
    | FStar_Pervasives_Native.Some(e) -> decode t e
    | _ -> failwith "Failed to encode data"
let message = match decodedData with
    | FStar_Pervasives_Native.Some(d) -> (System.String.Concat(Array.ofList(d)) + "\n")
    | _ -> failwith "Failed to decode data"
print_string "After roundtip, value of 'THE ESSENTIAL FEATURE' is:\n";;
print_string message;;
print_string "You can remove any letter from 'encoding' variable in the sample, to make it fails."
