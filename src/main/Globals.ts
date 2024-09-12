import { Stream } from "socketmost/dist/modules/Messages";
import { DongleConfig } from 'node-carplay/node'

export type ExtraConfig = DongleConfig & {
  kiosk: boolean,
  camera: string,
  microphone: string,
  bindings: KeyBindings
}

export interface KeyBindings {
  'left': string,
  'right': string,
  'selectDown': string,
  'back': string,
  'down': string,
  'home': string,
  'play': string,
  'pause': string,
  'next': string,
  'prev': string
}