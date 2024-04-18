import { PronoteApiDiscussionCommandType } from "~/constants/discussion";
import type { PronoteApiFunctions } from "~/constants/functions";
import type { PronoteApiOnglets } from "~/constants/onglets";
import type { Session } from "~/session";

export interface PronoteApiUserDiscussionCommand {
  request: {
    _Signature_: {
      onglet: PronoteApiOnglets.Discussions
    }

    donnees: {
      commande: PronoteApiDiscussionCommandType
      listePossessionsMessages: Array<{ N: string }>
    }
  }

  response: {
    donnees: {}
    RapportSaisie: {}
    nom: PronoteApiFunctions.CreateMessage
  }
}

export interface ApiUserDiscussionCommand {
  input: {
    session: Session
    command: PronoteApiDiscussionCommandType
    possessions: Array<{ N: string }>
  }

  output: PronoteApiUserDiscussionCommand["response"]
}
