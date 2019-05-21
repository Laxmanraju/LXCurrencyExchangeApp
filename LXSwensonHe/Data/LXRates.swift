//
//  LXRates.swift
//
//  Created by Laxman Penmesta on 5/16/19
//  Copyright (c) Laxman. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class LXRates: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let xAF = "XAF"
    static let rON = "RON"
    static let mYR = "MYR"
    static let zMK = "ZMK"
    static let xAU = "XAU"
    static let aNG = "ANG"
    static let sVC = "SVC"
    static let bTN = "BTN"
    static let nGN = "NGN"
    static let bWP = "BWP"
    static let mRO = "MRO"
    static let mAD = "MAD"
    static let hTG = "HTG"
    static let sGD = "SGD"
    static let aLL = "ALL"
    static let rWF = "RWF"
    static let sEK = "SEK"
    static let jEP = "JEP"
    static let aMD = "AMD"
    static let tZS = "TZS"
    static let sLL = "SLL"
    static let mVR = "MVR"
    static let gEL = "GEL"
    static let uSD = "USD"
    static let lAK = "LAK"
    static let tWD = "TWD"
    static let bND = "BND"
    static let gYD = "GYD"
    static let fJD = "FJD"
    static let kGS = "KGS"
    static let aOA = "AOA"
    static let gNF = "GNF"
    static let cUP = "CUP"
    static let bDT = "BDT"
    static let oMR = "OMR"
    static let iNR = "INR"
    static let mZN = "MZN"
    static let jOD = "JOD"
    static let tHB = "THB"
    static let cNY = "CNY"
    static let cOP = "COP"
    static let lSL = "LSL"
    static let cUC = "CUC"
    static let aUD = "AUD"
    static let xDR = "XDR"
    static let pKR = "PKR"
    static let eUR = "EUR"
    static let zAR = "ZAR"
    static let lBP = "LBP"
    static let mKD = "MKD"
    static let tJS = "TJS"
    static let sHP = "SHP"
    static let vND = "VND"
    static let iQD = "IQD"
    static let cAD = "CAD"
    static let wST = "WST"
    static let dJF = "DJF"
    static let dKK = "DKK"
    static let sBD = "SBD"
    static let kES = "KES"
    static let pLN = "PLN"
    static let jPY = "JPY"
    static let tND = "TND"
    static let rUB = "RUB"
    static let bRL = "BRL"
    static let lRD = "LRD"
    static let cDF = "CDF"
    static let pEN = "PEN"
    static let bTC = "BTC"
    static let cVE = "CVE"
    static let pYG = "PYG"
    static let kZT = "KZT"
    static let sRD = "SRD"
    static let tMT = "TMT"
    static let kYD = "KYD"
    static let hKD = "HKD"
    static let mNT = "MNT"
    static let mXN = "MXN"
    static let cLF = "CLF"
    static let uZS = "UZS"
    static let pAB = "PAB"
    static let gHS = "GHS"
    static let gGP = "GGP"
    static let kHR = "KHR"
    static let iLS = "ILS"
    static let iDR = "IDR"
    static let xCD = "XCD"
    static let dOP = "DOP"
    static let eRN = "ERN"
    static let vUV = "VUV"
    static let xOF = "XOF"
    static let mWK = "MWK"
    static let iRR = "IRR"
    static let sDG = "SDG"
    static let kWD = "KWD"
    static let bHD = "BHD"
    static let fKP = "FKP"
    static let mDL = "MDL"
    static let mUR = "MUR"
    static let aRS = "ARS"
    static let gBP = "GBP"
    static let bMD = "BMD"
    static let cZK = "CZK"
    static let iMP = "IMP"
    static let mMK = "MMK"
    static let xAG = "XAG"
    static let sTD = "STD"
    static let nAD = "NAD"
    static let zMW = "ZMW"
    static let hRK = "HRK"
    static let nZD = "NZD"
    static let uYU = "UYU"
    static let bSD = "BSD"
    static let tTD = "TTD"
    static let bAM = "BAM"
    static let bGN = "BGN"
    static let lVL = "LVL"
    static let gIP = "GIP"
    static let eGP = "EGP"
    static let cRC = "CRC"
    static let hUF = "HUF"
    static let mOP = "MOP"
    static let nOK = "NOK"
    static let lYD = "LYD"
    static let kRW = "KRW"
    static let nIO = "NIO"
    static let bBD = "BBD"
    static let hNL = "HNL"
    static let jMD = "JMD"
    static let bOB = "BOB"
    static let gMD = "GMD"
    static let dZD = "DZD"
    static let gTQ = "GTQ"
    static let kMF = "KMF"
    static let qAR = "QAR"
    static let uAH = "UAH"
    static let sZL = "SZL"
    static let sAR = "SAR"
    static let aED = "AED"
    static let iSK = "ISK"
    static let aZN = "AZN"
    static let bZD = "BZD"
    static let aFN = "AFN"
    static let pGK = "PGK"
    static let pHP = "PHP"
    static let eTB = "ETB"
    static let bYR = "BYR"
    static let bIF = "BIF"
    static let vEF = "VEF"
    static let aWG = "AWG"
    static let kPW = "KPW"
    static let lTL = "LTL"
    static let zWL = "ZWL"
    static let tOP = "TOP"
    static let sOS = "SOS"
    static let mGA = "MGA"
    static let sCR = "SCR"
    static let sYP = "SYP"
    static let tRY = "TRY"
    static let nPR = "NPR"
    static let rSD = "RSD"
    static let bYN = "BYN"
    static let uGX = "UGX"
    static let cHF = "CHF"
    static let cLP = "CLP"
    static let yER = "YER"
    static let xPF = "XPF"
    static let lKR = "LKR"
  }

  // MARK: Properties
  public var xAF: Float?
  public var rON: Float?
  public var mYR: Float?
  public var zMK: Float?
  public var xAU: Float?
  public var aNG: Float?
  public var sVC: Float?
  public var bTN: Float?
  public var nGN: Float?
  public var bWP: Float?
  public var mRO: Float?
  public var mAD: Float?
  public var hTG: Float?
  public var sGD: Float?
  public var aLL: Float?
  public var rWF: Float?
  public var sEK: Float?
  public var jEP: Float?
  public var aMD: Float?
  public var tZS: Float?
  public var sLL: Float?
  public var mVR: Float?
  public var gEL: Float?
  public var uSD: Float?
  public var lAK: Float?
  public var tWD: Float?
  public var bND: Float?
  public var gYD: Float?
  public var fJD: Float?
  public var kGS: Float?
  public var aOA: Float?
  public var gNF: Float?
  public var cUP: Float?
  public var bDT: Float?
  public var oMR: Float?
  public var iNR: Float?
  public var mZN: Float?
  public var jOD: Float?
  public var tHB: Float?
  public var cNY: Float?
  public var cOP: Float?
  public var lSL: Float?
  public var cUC: Float?
  public var aUD: Float?
  public var xDR: Float?
  public var pKR: Float?
  public var eUR: Int?
  public var zAR: Float?
  public var lBP: Float?
  public var mKD: Float?
  public var tJS: Float?
  public var sHP: Float?
  public var vND: Float?
  public var iQD: Float?
  public var cAD: Float?
  public var wST: Float?
  public var dJF: Float?
  public var dKK: Float?
  public var sBD: Float?
  public var kES: Float?
  public var pLN: Float?
  public var jPY: Float?
  public var tND: Float?
  public var rUB: Float?
  public var bRL: Float?
  public var lRD: Float?
  public var cDF: Float?
  public var pEN: Float?
  public var bTC: Float?
  public var cVE: Float?
  public var pYG: Float?
  public var kZT: Float?
  public var sRD: Float?
  public var tMT: Float?
  public var kYD: Float?
  public var hKD: Float?
  public var mNT: Float?
  public var mXN: Float?
  public var cLF: Float?
  public var uZS: Float?
  public var pAB: Float?
  public var gHS: Float?
  public var gGP: Float?
  public var kHR: Float?
  public var iLS: Float?
  public var iDR: Float?
  public var xCD: Float?
  public var dOP: Float?
  public var eRN: Float?
  public var vUV: Float?
  public var xOF: Float?
  public var mWK: Float?
  public var iRR: Float?
  public var sDG: Float?
  public var kWD: Float?
  public var bHD: Float?
  public var fKP: Float?
  public var mDL: Float?
  public var mUR: Float?
  public var aRS: Float?
  public var gBP: Float?
  public var bMD: Float?
  public var cZK: Float?
  public var iMP: Float?
  public var mMK: Float?
  public var xAG: Float?
  public var sTD: Float?
  public var nAD: Float?
  public var zMW: Float?
  public var hRK: Float?
  public var nZD: Float?
  public var uYU: Float?
  public var bSD: Float?
  public var tTD: Float?
  public var bAM: Float?
  public var bGN: Float?
  public var lVL: Float?
  public var gIP: Float?
  public var eGP: Float?
  public var cRC: Float?
  public var hUF: Float?
  public var mOP: Float?
  public var nOK: Float?
  public var lYD: Float?
  public var kRW: Float?
  public var nIO: Float?
  public var bBD: Float?
  public var hNL: Float?
  public var jMD: Float?
  public var bOB: Float?
  public var gMD: Float?
  public var dZD: Float?
  public var gTQ: Float?
  public var kMF: Float?
  public var qAR: Float?
  public var uAH: Float?
  public var sZL: Float?
  public var sAR: Float?
  public var aED: Float?
  public var iSK: Float?
  public var aZN: Float?
  public var bZD: Float?
  public var aFN: Float?
  public var pGK: Float?
  public var pHP: Float?
  public var eTB: Float?
  public var bYR: Float?
  public var bIF: Float?
  public var vEF: Float?
  public var aWG: Float?
  public var kPW: Float?
  public var lTL: Float?
  public var zWL: Float?
  public var tOP: Float?
  public var sOS: Float?
  public var mGA: Float?
  public var sCR: Float?
  public var sYP: Float?
  public var tRY: Float?
  public var nPR: Float?
  public var rSD: Float?
  public var bYN: Float?
  public var uGX: Float?
  public var cHF: Float?
  public var cLP: Float?
  public var yER: Float?
  public var xPF: Float?
  public var lKR: Float?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    xAF = json[SerializationKeys.xAF].float
    rON = json[SerializationKeys.rON].float
    mYR = json[SerializationKeys.mYR].float
    zMK = json[SerializationKeys.zMK].float
    xAU = json[SerializationKeys.xAU].float
    aNG = json[SerializationKeys.aNG].float
    sVC = json[SerializationKeys.sVC].float
    bTN = json[SerializationKeys.bTN].float
    nGN = json[SerializationKeys.nGN].float
    bWP = json[SerializationKeys.bWP].float
    mRO = json[SerializationKeys.mRO].float
    mAD = json[SerializationKeys.mAD].float
    hTG = json[SerializationKeys.hTG].float
    sGD = json[SerializationKeys.sGD].float
    aLL = json[SerializationKeys.aLL].float
    rWF = json[SerializationKeys.rWF].float
    sEK = json[SerializationKeys.sEK].float
    jEP = json[SerializationKeys.jEP].float
    aMD = json[SerializationKeys.aMD].float
    tZS = json[SerializationKeys.tZS].float
    sLL = json[SerializationKeys.sLL].float
    mVR = json[SerializationKeys.mVR].float
    gEL = json[SerializationKeys.gEL].float
    uSD = json[SerializationKeys.uSD].float
    lAK = json[SerializationKeys.lAK].float
    tWD = json[SerializationKeys.tWD].float
    bND = json[SerializationKeys.bND].float
    gYD = json[SerializationKeys.gYD].float
    fJD = json[SerializationKeys.fJD].float
    kGS = json[SerializationKeys.kGS].float
    aOA = json[SerializationKeys.aOA].float
    gNF = json[SerializationKeys.gNF].float
    cUP = json[SerializationKeys.cUP].float
    bDT = json[SerializationKeys.bDT].float
    oMR = json[SerializationKeys.oMR].float
    iNR = json[SerializationKeys.iNR].float
    mZN = json[SerializationKeys.mZN].float
    jOD = json[SerializationKeys.jOD].float
    tHB = json[SerializationKeys.tHB].float
    cNY = json[SerializationKeys.cNY].float
    cOP = json[SerializationKeys.cOP].float
    lSL = json[SerializationKeys.lSL].float
    cUC = json[SerializationKeys.cUC].float
    aUD = json[SerializationKeys.aUD].float
    xDR = json[SerializationKeys.xDR].float
    pKR = json[SerializationKeys.pKR].float
    eUR = json[SerializationKeys.eUR].int
    zAR = json[SerializationKeys.zAR].float
    lBP = json[SerializationKeys.lBP].float
    mKD = json[SerializationKeys.mKD].float
    tJS = json[SerializationKeys.tJS].float
    sHP = json[SerializationKeys.sHP].float
    vND = json[SerializationKeys.vND].float
    iQD = json[SerializationKeys.iQD].float
    cAD = json[SerializationKeys.cAD].float
    wST = json[SerializationKeys.wST].float
    dJF = json[SerializationKeys.dJF].float
    dKK = json[SerializationKeys.dKK].float
    sBD = json[SerializationKeys.sBD].float
    kES = json[SerializationKeys.kES].float
    pLN = json[SerializationKeys.pLN].float
    jPY = json[SerializationKeys.jPY].float
    tND = json[SerializationKeys.tND].float
    rUB = json[SerializationKeys.rUB].float
    bRL = json[SerializationKeys.bRL].float
    lRD = json[SerializationKeys.lRD].float
    cDF = json[SerializationKeys.cDF].float
    pEN = json[SerializationKeys.pEN].float
    bTC = json[SerializationKeys.bTC].float
    cVE = json[SerializationKeys.cVE].float
    pYG = json[SerializationKeys.pYG].float
    kZT = json[SerializationKeys.kZT].float
    sRD = json[SerializationKeys.sRD].float
    tMT = json[SerializationKeys.tMT].float
    kYD = json[SerializationKeys.kYD].float
    hKD = json[SerializationKeys.hKD].float
    mNT = json[SerializationKeys.mNT].float
    mXN = json[SerializationKeys.mXN].float
    cLF = json[SerializationKeys.cLF].float
    uZS = json[SerializationKeys.uZS].float
    pAB = json[SerializationKeys.pAB].float
    gHS = json[SerializationKeys.gHS].float
    gGP = json[SerializationKeys.gGP].float
    kHR = json[SerializationKeys.kHR].float
    iLS = json[SerializationKeys.iLS].float
    iDR = json[SerializationKeys.iDR].float
    xCD = json[SerializationKeys.xCD].float
    dOP = json[SerializationKeys.dOP].float
    eRN = json[SerializationKeys.eRN].float
    vUV = json[SerializationKeys.vUV].float
    xOF = json[SerializationKeys.xOF].float
    mWK = json[SerializationKeys.mWK].float
    iRR = json[SerializationKeys.iRR].float
    sDG = json[SerializationKeys.sDG].float
    kWD = json[SerializationKeys.kWD].float
    bHD = json[SerializationKeys.bHD].float
    fKP = json[SerializationKeys.fKP].float
    mDL = json[SerializationKeys.mDL].float
    mUR = json[SerializationKeys.mUR].float
    aRS = json[SerializationKeys.aRS].float
    gBP = json[SerializationKeys.gBP].float
    bMD = json[SerializationKeys.bMD].float
    cZK = json[SerializationKeys.cZK].float
    iMP = json[SerializationKeys.iMP].float
    mMK = json[SerializationKeys.mMK].float
    xAG = json[SerializationKeys.xAG].float
    sTD = json[SerializationKeys.sTD].float
    nAD = json[SerializationKeys.nAD].float
    zMW = json[SerializationKeys.zMW].float
    hRK = json[SerializationKeys.hRK].float
    nZD = json[SerializationKeys.nZD].float
    uYU = json[SerializationKeys.uYU].float
    bSD = json[SerializationKeys.bSD].float
    tTD = json[SerializationKeys.tTD].float
    bAM = json[SerializationKeys.bAM].float
    bGN = json[SerializationKeys.bGN].float
    lVL = json[SerializationKeys.lVL].float
    gIP = json[SerializationKeys.gIP].float
    eGP = json[SerializationKeys.eGP].float
    cRC = json[SerializationKeys.cRC].float
    hUF = json[SerializationKeys.hUF].float
    mOP = json[SerializationKeys.mOP].float
    nOK = json[SerializationKeys.nOK].float
    lYD = json[SerializationKeys.lYD].float
    kRW = json[SerializationKeys.kRW].float
    nIO = json[SerializationKeys.nIO].float
    bBD = json[SerializationKeys.bBD].float
    hNL = json[SerializationKeys.hNL].float
    jMD = json[SerializationKeys.jMD].float
    bOB = json[SerializationKeys.bOB].float
    gMD = json[SerializationKeys.gMD].float
    dZD = json[SerializationKeys.dZD].float
    gTQ = json[SerializationKeys.gTQ].float
    kMF = json[SerializationKeys.kMF].float
    qAR = json[SerializationKeys.qAR].float
    uAH = json[SerializationKeys.uAH].float
    sZL = json[SerializationKeys.sZL].float
    sAR = json[SerializationKeys.sAR].float
    aED = json[SerializationKeys.aED].float
    iSK = json[SerializationKeys.iSK].float
    aZN = json[SerializationKeys.aZN].float
    bZD = json[SerializationKeys.bZD].float
    aFN = json[SerializationKeys.aFN].float
    pGK = json[SerializationKeys.pGK].float
    pHP = json[SerializationKeys.pHP].float
    eTB = json[SerializationKeys.eTB].float
    bYR = json[SerializationKeys.bYR].float
    bIF = json[SerializationKeys.bIF].float
    vEF = json[SerializationKeys.vEF].float
    aWG = json[SerializationKeys.aWG].float
    kPW = json[SerializationKeys.kPW].float
    lTL = json[SerializationKeys.lTL].float
    zWL = json[SerializationKeys.zWL].float
    tOP = json[SerializationKeys.tOP].float
    sOS = json[SerializationKeys.sOS].float
    mGA = json[SerializationKeys.mGA].float
    sCR = json[SerializationKeys.sCR].float
    sYP = json[SerializationKeys.sYP].float
    tRY = json[SerializationKeys.tRY].float
    nPR = json[SerializationKeys.nPR].float
    rSD = json[SerializationKeys.rSD].float
    bYN = json[SerializationKeys.bYN].float
    uGX = json[SerializationKeys.uGX].float
    cHF = json[SerializationKeys.cHF].float
    cLP = json[SerializationKeys.cLP].float
    yER = json[SerializationKeys.yER].float
    xPF = json[SerializationKeys.xPF].float
    lKR = json[SerializationKeys.lKR].float
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = xAF { dictionary[SerializationKeys.xAF] = value }
    if let value = rON { dictionary[SerializationKeys.rON] = value }
    if let value = mYR { dictionary[SerializationKeys.mYR] = value }
    if let value = zMK { dictionary[SerializationKeys.zMK] = value }
    if let value = xAU { dictionary[SerializationKeys.xAU] = value }
    if let value = aNG { dictionary[SerializationKeys.aNG] = value }
    if let value = sVC { dictionary[SerializationKeys.sVC] = value }
    if let value = bTN { dictionary[SerializationKeys.bTN] = value }
    if let value = nGN { dictionary[SerializationKeys.nGN] = value }
    if let value = bWP { dictionary[SerializationKeys.bWP] = value }
    if let value = mRO { dictionary[SerializationKeys.mRO] = value }
    if let value = mAD { dictionary[SerializationKeys.mAD] = value }
    if let value = hTG { dictionary[SerializationKeys.hTG] = value }
    if let value = sGD { dictionary[SerializationKeys.sGD] = value }
    if let value = aLL { dictionary[SerializationKeys.aLL] = value }
    if let value = rWF { dictionary[SerializationKeys.rWF] = value }
    if let value = sEK { dictionary[SerializationKeys.sEK] = value }
    if let value = jEP { dictionary[SerializationKeys.jEP] = value }
    if let value = aMD { dictionary[SerializationKeys.aMD] = value }
    if let value = tZS { dictionary[SerializationKeys.tZS] = value }
    if let value = sLL { dictionary[SerializationKeys.sLL] = value }
    if let value = mVR { dictionary[SerializationKeys.mVR] = value }
    if let value = gEL { dictionary[SerializationKeys.gEL] = value }
    if let value = uSD { dictionary[SerializationKeys.uSD] = value }
    if let value = lAK { dictionary[SerializationKeys.lAK] = value }
    if let value = tWD { dictionary[SerializationKeys.tWD] = value }
    if let value = bND { dictionary[SerializationKeys.bND] = value }
    if let value = gYD { dictionary[SerializationKeys.gYD] = value }
    if let value = fJD { dictionary[SerializationKeys.fJD] = value }
    if let value = kGS { dictionary[SerializationKeys.kGS] = value }
    if let value = aOA { dictionary[SerializationKeys.aOA] = value }
    if let value = gNF { dictionary[SerializationKeys.gNF] = value }
    if let value = cUP { dictionary[SerializationKeys.cUP] = value }
    if let value = bDT { dictionary[SerializationKeys.bDT] = value }
    if let value = oMR { dictionary[SerializationKeys.oMR] = value }
    if let value = iNR { dictionary[SerializationKeys.iNR] = value }
    if let value = mZN { dictionary[SerializationKeys.mZN] = value }
    if let value = jOD { dictionary[SerializationKeys.jOD] = value }
    if let value = tHB { dictionary[SerializationKeys.tHB] = value }
    if let value = cNY { dictionary[SerializationKeys.cNY] = value }
    if let value = cOP { dictionary[SerializationKeys.cOP] = value }
    if let value = lSL { dictionary[SerializationKeys.lSL] = value }
    if let value = cUC { dictionary[SerializationKeys.cUC] = value }
    if let value = aUD { dictionary[SerializationKeys.aUD] = value }
    if let value = xDR { dictionary[SerializationKeys.xDR] = value }
    if let value = pKR { dictionary[SerializationKeys.pKR] = value }
    if let value = eUR { dictionary[SerializationKeys.eUR] = value }
    if let value = zAR { dictionary[SerializationKeys.zAR] = value }
    if let value = lBP { dictionary[SerializationKeys.lBP] = value }
    if let value = mKD { dictionary[SerializationKeys.mKD] = value }
    if let value = tJS { dictionary[SerializationKeys.tJS] = value }
    if let value = sHP { dictionary[SerializationKeys.sHP] = value }
    if let value = vND { dictionary[SerializationKeys.vND] = value }
    if let value = iQD { dictionary[SerializationKeys.iQD] = value }
    if let value = cAD { dictionary[SerializationKeys.cAD] = value }
    if let value = wST { dictionary[SerializationKeys.wST] = value }
    if let value = dJF { dictionary[SerializationKeys.dJF] = value }
    if let value = dKK { dictionary[SerializationKeys.dKK] = value }
    if let value = sBD { dictionary[SerializationKeys.sBD] = value }
    if let value = kES { dictionary[SerializationKeys.kES] = value }
    if let value = pLN { dictionary[SerializationKeys.pLN] = value }
    if let value = jPY { dictionary[SerializationKeys.jPY] = value }
    if let value = tND { dictionary[SerializationKeys.tND] = value }
    if let value = rUB { dictionary[SerializationKeys.rUB] = value }
    if let value = bRL { dictionary[SerializationKeys.bRL] = value }
    if let value = lRD { dictionary[SerializationKeys.lRD] = value }
    if let value = cDF { dictionary[SerializationKeys.cDF] = value }
    if let value = pEN { dictionary[SerializationKeys.pEN] = value }
    if let value = bTC { dictionary[SerializationKeys.bTC] = value }
    if let value = cVE { dictionary[SerializationKeys.cVE] = value }
    if let value = pYG { dictionary[SerializationKeys.pYG] = value }
    if let value = kZT { dictionary[SerializationKeys.kZT] = value }
    if let value = sRD { dictionary[SerializationKeys.sRD] = value }
    if let value = tMT { dictionary[SerializationKeys.tMT] = value }
    if let value = kYD { dictionary[SerializationKeys.kYD] = value }
    if let value = hKD { dictionary[SerializationKeys.hKD] = value }
    if let value = mNT { dictionary[SerializationKeys.mNT] = value }
    if let value = mXN { dictionary[SerializationKeys.mXN] = value }
    if let value = cLF { dictionary[SerializationKeys.cLF] = value }
    if let value = uZS { dictionary[SerializationKeys.uZS] = value }
    if let value = pAB { dictionary[SerializationKeys.pAB] = value }
    if let value = gHS { dictionary[SerializationKeys.gHS] = value }
    if let value = gGP { dictionary[SerializationKeys.gGP] = value }
    if let value = kHR { dictionary[SerializationKeys.kHR] = value }
    if let value = iLS { dictionary[SerializationKeys.iLS] = value }
    if let value = iDR { dictionary[SerializationKeys.iDR] = value }
    if let value = xCD { dictionary[SerializationKeys.xCD] = value }
    if let value = dOP { dictionary[SerializationKeys.dOP] = value }
    if let value = eRN { dictionary[SerializationKeys.eRN] = value }
    if let value = vUV { dictionary[SerializationKeys.vUV] = value }
    if let value = xOF { dictionary[SerializationKeys.xOF] = value }
    if let value = mWK { dictionary[SerializationKeys.mWK] = value }
    if let value = iRR { dictionary[SerializationKeys.iRR] = value }
    if let value = sDG { dictionary[SerializationKeys.sDG] = value }
    if let value = kWD { dictionary[SerializationKeys.kWD] = value }
    if let value = bHD { dictionary[SerializationKeys.bHD] = value }
    if let value = fKP { dictionary[SerializationKeys.fKP] = value }
    if let value = mDL { dictionary[SerializationKeys.mDL] = value }
    if let value = mUR { dictionary[SerializationKeys.mUR] = value }
    if let value = aRS { dictionary[SerializationKeys.aRS] = value }
    if let value = gBP { dictionary[SerializationKeys.gBP] = value }
    if let value = bMD { dictionary[SerializationKeys.bMD] = value }
    if let value = cZK { dictionary[SerializationKeys.cZK] = value }
    if let value = iMP { dictionary[SerializationKeys.iMP] = value }
    if let value = mMK { dictionary[SerializationKeys.mMK] = value }
    if let value = xAG { dictionary[SerializationKeys.xAG] = value }
    if let value = sTD { dictionary[SerializationKeys.sTD] = value }
    if let value = nAD { dictionary[SerializationKeys.nAD] = value }
    if let value = zMW { dictionary[SerializationKeys.zMW] = value }
    if let value = hRK { dictionary[SerializationKeys.hRK] = value }
    if let value = nZD { dictionary[SerializationKeys.nZD] = value }
    if let value = uYU { dictionary[SerializationKeys.uYU] = value }
    if let value = bSD { dictionary[SerializationKeys.bSD] = value }
    if let value = tTD { dictionary[SerializationKeys.tTD] = value }
    if let value = bAM { dictionary[SerializationKeys.bAM] = value }
    if let value = bGN { dictionary[SerializationKeys.bGN] = value }
    if let value = lVL { dictionary[SerializationKeys.lVL] = value }
    if let value = gIP { dictionary[SerializationKeys.gIP] = value }
    if let value = eGP { dictionary[SerializationKeys.eGP] = value }
    if let value = cRC { dictionary[SerializationKeys.cRC] = value }
    if let value = hUF { dictionary[SerializationKeys.hUF] = value }
    if let value = mOP { dictionary[SerializationKeys.mOP] = value }
    if let value = nOK { dictionary[SerializationKeys.nOK] = value }
    if let value = lYD { dictionary[SerializationKeys.lYD] = value }
    if let value = kRW { dictionary[SerializationKeys.kRW] = value }
    if let value = nIO { dictionary[SerializationKeys.nIO] = value }
    if let value = bBD { dictionary[SerializationKeys.bBD] = value }
    if let value = hNL { dictionary[SerializationKeys.hNL] = value }
    if let value = jMD { dictionary[SerializationKeys.jMD] = value }
    if let value = bOB { dictionary[SerializationKeys.bOB] = value }
    if let value = gMD { dictionary[SerializationKeys.gMD] = value }
    if let value = dZD { dictionary[SerializationKeys.dZD] = value }
    if let value = gTQ { dictionary[SerializationKeys.gTQ] = value }
    if let value = kMF { dictionary[SerializationKeys.kMF] = value }
    if let value = qAR { dictionary[SerializationKeys.qAR] = value }
    if let value = uAH { dictionary[SerializationKeys.uAH] = value }
    if let value = sZL { dictionary[SerializationKeys.sZL] = value }
    if let value = sAR { dictionary[SerializationKeys.sAR] = value }
    if let value = aED { dictionary[SerializationKeys.aED] = value }
    if let value = iSK { dictionary[SerializationKeys.iSK] = value }
    if let value = aZN { dictionary[SerializationKeys.aZN] = value }
    if let value = bZD { dictionary[SerializationKeys.bZD] = value }
    if let value = aFN { dictionary[SerializationKeys.aFN] = value }
    if let value = pGK { dictionary[SerializationKeys.pGK] = value }
    if let value = pHP { dictionary[SerializationKeys.pHP] = value }
    if let value = eTB { dictionary[SerializationKeys.eTB] = value }
    if let value = bYR { dictionary[SerializationKeys.bYR] = value }
    if let value = bIF { dictionary[SerializationKeys.bIF] = value }
    if let value = vEF { dictionary[SerializationKeys.vEF] = value }
    if let value = aWG { dictionary[SerializationKeys.aWG] = value }
    if let value = kPW { dictionary[SerializationKeys.kPW] = value }
    if let value = lTL { dictionary[SerializationKeys.lTL] = value }
    if let value = zWL { dictionary[SerializationKeys.zWL] = value }
    if let value = tOP { dictionary[SerializationKeys.tOP] = value }
    if let value = sOS { dictionary[SerializationKeys.sOS] = value }
    if let value = mGA { dictionary[SerializationKeys.mGA] = value }
    if let value = sCR { dictionary[SerializationKeys.sCR] = value }
    if let value = sYP { dictionary[SerializationKeys.sYP] = value }
    if let value = tRY { dictionary[SerializationKeys.tRY] = value }
    if let value = nPR { dictionary[SerializationKeys.nPR] = value }
    if let value = rSD { dictionary[SerializationKeys.rSD] = value }
    if let value = bYN { dictionary[SerializationKeys.bYN] = value }
    if let value = uGX { dictionary[SerializationKeys.uGX] = value }
    if let value = cHF { dictionary[SerializationKeys.cHF] = value }
    if let value = cLP { dictionary[SerializationKeys.cLP] = value }
    if let value = yER { dictionary[SerializationKeys.yER] = value }
    if let value = xPF { dictionary[SerializationKeys.xPF] = value }
    if let value = lKR { dictionary[SerializationKeys.lKR] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.xAF = aDecoder.decodeObject(forKey: SerializationKeys.xAF) as? Float
    self.rON = aDecoder.decodeObject(forKey: SerializationKeys.rON) as? Float
    self.mYR = aDecoder.decodeObject(forKey: SerializationKeys.mYR) as? Float
    self.zMK = aDecoder.decodeObject(forKey: SerializationKeys.zMK) as? Float
    self.xAU = aDecoder.decodeObject(forKey: SerializationKeys.xAU) as? Float
    self.aNG = aDecoder.decodeObject(forKey: SerializationKeys.aNG) as? Float
    self.sVC = aDecoder.decodeObject(forKey: SerializationKeys.sVC) as? Float
    self.bTN = aDecoder.decodeObject(forKey: SerializationKeys.bTN) as? Float
    self.nGN = aDecoder.decodeObject(forKey: SerializationKeys.nGN) as? Float
    self.bWP = aDecoder.decodeObject(forKey: SerializationKeys.bWP) as? Float
    self.mRO = aDecoder.decodeObject(forKey: SerializationKeys.mRO) as? Float
    self.mAD = aDecoder.decodeObject(forKey: SerializationKeys.mAD) as? Float
    self.hTG = aDecoder.decodeObject(forKey: SerializationKeys.hTG) as? Float
    self.sGD = aDecoder.decodeObject(forKey: SerializationKeys.sGD) as? Float
    self.aLL = aDecoder.decodeObject(forKey: SerializationKeys.aLL) as? Float
    self.rWF = aDecoder.decodeObject(forKey: SerializationKeys.rWF) as? Float
    self.sEK = aDecoder.decodeObject(forKey: SerializationKeys.sEK) as? Float
    self.jEP = aDecoder.decodeObject(forKey: SerializationKeys.jEP) as? Float
    self.aMD = aDecoder.decodeObject(forKey: SerializationKeys.aMD) as? Float
    self.tZS = aDecoder.decodeObject(forKey: SerializationKeys.tZS) as? Float
    self.sLL = aDecoder.decodeObject(forKey: SerializationKeys.sLL) as? Float
    self.mVR = aDecoder.decodeObject(forKey: SerializationKeys.mVR) as? Float
    self.gEL = aDecoder.decodeObject(forKey: SerializationKeys.gEL) as? Float
    self.uSD = aDecoder.decodeObject(forKey: SerializationKeys.uSD) as? Float
    self.lAK = aDecoder.decodeObject(forKey: SerializationKeys.lAK) as? Float
    self.tWD = aDecoder.decodeObject(forKey: SerializationKeys.tWD) as? Float
    self.bND = aDecoder.decodeObject(forKey: SerializationKeys.bND) as? Float
    self.gYD = aDecoder.decodeObject(forKey: SerializationKeys.gYD) as? Float
    self.fJD = aDecoder.decodeObject(forKey: SerializationKeys.fJD) as? Float
    self.kGS = aDecoder.decodeObject(forKey: SerializationKeys.kGS) as? Float
    self.aOA = aDecoder.decodeObject(forKey: SerializationKeys.aOA) as? Float
    self.gNF = aDecoder.decodeObject(forKey: SerializationKeys.gNF) as? Float
    self.cUP = aDecoder.decodeObject(forKey: SerializationKeys.cUP) as? Float
    self.bDT = aDecoder.decodeObject(forKey: SerializationKeys.bDT) as? Float
    self.oMR = aDecoder.decodeObject(forKey: SerializationKeys.oMR) as? Float
    self.iNR = aDecoder.decodeObject(forKey: SerializationKeys.iNR) as? Float
    self.mZN = aDecoder.decodeObject(forKey: SerializationKeys.mZN) as? Float
    self.jOD = aDecoder.decodeObject(forKey: SerializationKeys.jOD) as? Float
    self.tHB = aDecoder.decodeObject(forKey: SerializationKeys.tHB) as? Float
    self.cNY = aDecoder.decodeObject(forKey: SerializationKeys.cNY) as? Float
    self.cOP = aDecoder.decodeObject(forKey: SerializationKeys.cOP) as? Float
    self.lSL = aDecoder.decodeObject(forKey: SerializationKeys.lSL) as? Float
    self.cUC = aDecoder.decodeObject(forKey: SerializationKeys.cUC) as? Float
    self.aUD = aDecoder.decodeObject(forKey: SerializationKeys.aUD) as? Float
    self.xDR = aDecoder.decodeObject(forKey: SerializationKeys.xDR) as? Float
    self.pKR = aDecoder.decodeObject(forKey: SerializationKeys.pKR) as? Float
    self.eUR = aDecoder.decodeObject(forKey: SerializationKeys.eUR) as? Int
    self.zAR = aDecoder.decodeObject(forKey: SerializationKeys.zAR) as? Float
    self.lBP = aDecoder.decodeObject(forKey: SerializationKeys.lBP) as? Float
    self.mKD = aDecoder.decodeObject(forKey: SerializationKeys.mKD) as? Float
    self.tJS = aDecoder.decodeObject(forKey: SerializationKeys.tJS) as? Float
    self.sHP = aDecoder.decodeObject(forKey: SerializationKeys.sHP) as? Float
    self.vND = aDecoder.decodeObject(forKey: SerializationKeys.vND) as? Float
    self.iQD = aDecoder.decodeObject(forKey: SerializationKeys.iQD) as? Float
    self.cAD = aDecoder.decodeObject(forKey: SerializationKeys.cAD) as? Float
    self.wST = aDecoder.decodeObject(forKey: SerializationKeys.wST) as? Float
    self.dJF = aDecoder.decodeObject(forKey: SerializationKeys.dJF) as? Float
    self.dKK = aDecoder.decodeObject(forKey: SerializationKeys.dKK) as? Float
    self.sBD = aDecoder.decodeObject(forKey: SerializationKeys.sBD) as? Float
    self.kES = aDecoder.decodeObject(forKey: SerializationKeys.kES) as? Float
    self.pLN = aDecoder.decodeObject(forKey: SerializationKeys.pLN) as? Float
    self.jPY = aDecoder.decodeObject(forKey: SerializationKeys.jPY) as? Float
    self.tND = aDecoder.decodeObject(forKey: SerializationKeys.tND) as? Float
    self.rUB = aDecoder.decodeObject(forKey: SerializationKeys.rUB) as? Float
    self.bRL = aDecoder.decodeObject(forKey: SerializationKeys.bRL) as? Float
    self.lRD = aDecoder.decodeObject(forKey: SerializationKeys.lRD) as? Float
    self.cDF = aDecoder.decodeObject(forKey: SerializationKeys.cDF) as? Float
    self.pEN = aDecoder.decodeObject(forKey: SerializationKeys.pEN) as? Float
    self.bTC = aDecoder.decodeObject(forKey: SerializationKeys.bTC) as? Float
    self.cVE = aDecoder.decodeObject(forKey: SerializationKeys.cVE) as? Float
    self.pYG = aDecoder.decodeObject(forKey: SerializationKeys.pYG) as? Float
    self.kZT = aDecoder.decodeObject(forKey: SerializationKeys.kZT) as? Float
    self.sRD = aDecoder.decodeObject(forKey: SerializationKeys.sRD) as? Float
    self.tMT = aDecoder.decodeObject(forKey: SerializationKeys.tMT) as? Float
    self.kYD = aDecoder.decodeObject(forKey: SerializationKeys.kYD) as? Float
    self.hKD = aDecoder.decodeObject(forKey: SerializationKeys.hKD) as? Float
    self.mNT = aDecoder.decodeObject(forKey: SerializationKeys.mNT) as? Float
    self.mXN = aDecoder.decodeObject(forKey: SerializationKeys.mXN) as? Float
    self.cLF = aDecoder.decodeObject(forKey: SerializationKeys.cLF) as? Float
    self.uZS = aDecoder.decodeObject(forKey: SerializationKeys.uZS) as? Float
    self.pAB = aDecoder.decodeObject(forKey: SerializationKeys.pAB) as? Float
    self.gHS = aDecoder.decodeObject(forKey: SerializationKeys.gHS) as? Float
    self.gGP = aDecoder.decodeObject(forKey: SerializationKeys.gGP) as? Float
    self.kHR = aDecoder.decodeObject(forKey: SerializationKeys.kHR) as? Float
    self.iLS = aDecoder.decodeObject(forKey: SerializationKeys.iLS) as? Float
    self.iDR = aDecoder.decodeObject(forKey: SerializationKeys.iDR) as? Float
    self.xCD = aDecoder.decodeObject(forKey: SerializationKeys.xCD) as? Float
    self.dOP = aDecoder.decodeObject(forKey: SerializationKeys.dOP) as? Float
    self.eRN = aDecoder.decodeObject(forKey: SerializationKeys.eRN) as? Float
    self.vUV = aDecoder.decodeObject(forKey: SerializationKeys.vUV) as? Float
    self.xOF = aDecoder.decodeObject(forKey: SerializationKeys.xOF) as? Float
    self.mWK = aDecoder.decodeObject(forKey: SerializationKeys.mWK) as? Float
    self.iRR = aDecoder.decodeObject(forKey: SerializationKeys.iRR) as? Float
    self.sDG = aDecoder.decodeObject(forKey: SerializationKeys.sDG) as? Float
    self.kWD = aDecoder.decodeObject(forKey: SerializationKeys.kWD) as? Float
    self.bHD = aDecoder.decodeObject(forKey: SerializationKeys.bHD) as? Float
    self.fKP = aDecoder.decodeObject(forKey: SerializationKeys.fKP) as? Float
    self.mDL = aDecoder.decodeObject(forKey: SerializationKeys.mDL) as? Float
    self.mUR = aDecoder.decodeObject(forKey: SerializationKeys.mUR) as? Float
    self.aRS = aDecoder.decodeObject(forKey: SerializationKeys.aRS) as? Float
    self.gBP = aDecoder.decodeObject(forKey: SerializationKeys.gBP) as? Float
    self.bMD = aDecoder.decodeObject(forKey: SerializationKeys.bMD) as? Float
    self.cZK = aDecoder.decodeObject(forKey: SerializationKeys.cZK) as? Float
    self.iMP = aDecoder.decodeObject(forKey: SerializationKeys.iMP) as? Float
    self.mMK = aDecoder.decodeObject(forKey: SerializationKeys.mMK) as? Float
    self.xAG = aDecoder.decodeObject(forKey: SerializationKeys.xAG) as? Float
    self.sTD = aDecoder.decodeObject(forKey: SerializationKeys.sTD) as? Float
    self.nAD = aDecoder.decodeObject(forKey: SerializationKeys.nAD) as? Float
    self.zMW = aDecoder.decodeObject(forKey: SerializationKeys.zMW) as? Float
    self.hRK = aDecoder.decodeObject(forKey: SerializationKeys.hRK) as? Float
    self.nZD = aDecoder.decodeObject(forKey: SerializationKeys.nZD) as? Float
    self.uYU = aDecoder.decodeObject(forKey: SerializationKeys.uYU) as? Float
    self.bSD = aDecoder.decodeObject(forKey: SerializationKeys.bSD) as? Float
    self.tTD = aDecoder.decodeObject(forKey: SerializationKeys.tTD) as? Float
    self.bAM = aDecoder.decodeObject(forKey: SerializationKeys.bAM) as? Float
    self.bGN = aDecoder.decodeObject(forKey: SerializationKeys.bGN) as? Float
    self.lVL = aDecoder.decodeObject(forKey: SerializationKeys.lVL) as? Float
    self.gIP = aDecoder.decodeObject(forKey: SerializationKeys.gIP) as? Float
    self.eGP = aDecoder.decodeObject(forKey: SerializationKeys.eGP) as? Float
    self.cRC = aDecoder.decodeObject(forKey: SerializationKeys.cRC) as? Float
    self.hUF = aDecoder.decodeObject(forKey: SerializationKeys.hUF) as? Float
    self.mOP = aDecoder.decodeObject(forKey: SerializationKeys.mOP) as? Float
    self.nOK = aDecoder.decodeObject(forKey: SerializationKeys.nOK) as? Float
    self.lYD = aDecoder.decodeObject(forKey: SerializationKeys.lYD) as? Float
    self.kRW = aDecoder.decodeObject(forKey: SerializationKeys.kRW) as? Float
    self.nIO = aDecoder.decodeObject(forKey: SerializationKeys.nIO) as? Float
    self.bBD = aDecoder.decodeObject(forKey: SerializationKeys.bBD) as? Float
    self.hNL = aDecoder.decodeObject(forKey: SerializationKeys.hNL) as? Float
    self.jMD = aDecoder.decodeObject(forKey: SerializationKeys.jMD) as? Float
    self.bOB = aDecoder.decodeObject(forKey: SerializationKeys.bOB) as? Float
    self.gMD = aDecoder.decodeObject(forKey: SerializationKeys.gMD) as? Float
    self.dZD = aDecoder.decodeObject(forKey: SerializationKeys.dZD) as? Float
    self.gTQ = aDecoder.decodeObject(forKey: SerializationKeys.gTQ) as? Float
    self.kMF = aDecoder.decodeObject(forKey: SerializationKeys.kMF) as? Float
    self.qAR = aDecoder.decodeObject(forKey: SerializationKeys.qAR) as? Float
    self.uAH = aDecoder.decodeObject(forKey: SerializationKeys.uAH) as? Float
    self.sZL = aDecoder.decodeObject(forKey: SerializationKeys.sZL) as? Float
    self.sAR = aDecoder.decodeObject(forKey: SerializationKeys.sAR) as? Float
    self.aED = aDecoder.decodeObject(forKey: SerializationKeys.aED) as? Float
    self.iSK = aDecoder.decodeObject(forKey: SerializationKeys.iSK) as? Float
    self.aZN = aDecoder.decodeObject(forKey: SerializationKeys.aZN) as? Float
    self.bZD = aDecoder.decodeObject(forKey: SerializationKeys.bZD) as? Float
    self.aFN = aDecoder.decodeObject(forKey: SerializationKeys.aFN) as? Float
    self.pGK = aDecoder.decodeObject(forKey: SerializationKeys.pGK) as? Float
    self.pHP = aDecoder.decodeObject(forKey: SerializationKeys.pHP) as? Float
    self.eTB = aDecoder.decodeObject(forKey: SerializationKeys.eTB) as? Float
    self.bYR = aDecoder.decodeObject(forKey: SerializationKeys.bYR) as? Float
    self.bIF = aDecoder.decodeObject(forKey: SerializationKeys.bIF) as? Float
    self.vEF = aDecoder.decodeObject(forKey: SerializationKeys.vEF) as? Float
    self.aWG = aDecoder.decodeObject(forKey: SerializationKeys.aWG) as? Float
    self.kPW = aDecoder.decodeObject(forKey: SerializationKeys.kPW) as? Float
    self.lTL = aDecoder.decodeObject(forKey: SerializationKeys.lTL) as? Float
    self.zWL = aDecoder.decodeObject(forKey: SerializationKeys.zWL) as? Float
    self.tOP = aDecoder.decodeObject(forKey: SerializationKeys.tOP) as? Float
    self.sOS = aDecoder.decodeObject(forKey: SerializationKeys.sOS) as? Float
    self.mGA = aDecoder.decodeObject(forKey: SerializationKeys.mGA) as? Float
    self.sCR = aDecoder.decodeObject(forKey: SerializationKeys.sCR) as? Float
    self.sYP = aDecoder.decodeObject(forKey: SerializationKeys.sYP) as? Float
    self.tRY = aDecoder.decodeObject(forKey: SerializationKeys.tRY) as? Float
    self.nPR = aDecoder.decodeObject(forKey: SerializationKeys.nPR) as? Float
    self.rSD = aDecoder.decodeObject(forKey: SerializationKeys.rSD) as? Float
    self.bYN = aDecoder.decodeObject(forKey: SerializationKeys.bYN) as? Float
    self.uGX = aDecoder.decodeObject(forKey: SerializationKeys.uGX) as? Float
    self.cHF = aDecoder.decodeObject(forKey: SerializationKeys.cHF) as? Float
    self.cLP = aDecoder.decodeObject(forKey: SerializationKeys.cLP) as? Float
    self.yER = aDecoder.decodeObject(forKey: SerializationKeys.yER) as? Float
    self.xPF = aDecoder.decodeObject(forKey: SerializationKeys.xPF) as? Float
    self.lKR = aDecoder.decodeObject(forKey: SerializationKeys.lKR) as? Float
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(xAF, forKey: SerializationKeys.xAF)
    aCoder.encode(rON, forKey: SerializationKeys.rON)
    aCoder.encode(mYR, forKey: SerializationKeys.mYR)
    aCoder.encode(zMK, forKey: SerializationKeys.zMK)
    aCoder.encode(xAU, forKey: SerializationKeys.xAU)
    aCoder.encode(aNG, forKey: SerializationKeys.aNG)
    aCoder.encode(sVC, forKey: SerializationKeys.sVC)
    aCoder.encode(bTN, forKey: SerializationKeys.bTN)
    aCoder.encode(nGN, forKey: SerializationKeys.nGN)
    aCoder.encode(bWP, forKey: SerializationKeys.bWP)
    aCoder.encode(mRO, forKey: SerializationKeys.mRO)
    aCoder.encode(mAD, forKey: SerializationKeys.mAD)
    aCoder.encode(hTG, forKey: SerializationKeys.hTG)
    aCoder.encode(sGD, forKey: SerializationKeys.sGD)
    aCoder.encode(aLL, forKey: SerializationKeys.aLL)
    aCoder.encode(rWF, forKey: SerializationKeys.rWF)
    aCoder.encode(sEK, forKey: SerializationKeys.sEK)
    aCoder.encode(jEP, forKey: SerializationKeys.jEP)
    aCoder.encode(aMD, forKey: SerializationKeys.aMD)
    aCoder.encode(tZS, forKey: SerializationKeys.tZS)
    aCoder.encode(sLL, forKey: SerializationKeys.sLL)
    aCoder.encode(mVR, forKey: SerializationKeys.mVR)
    aCoder.encode(gEL, forKey: SerializationKeys.gEL)
    aCoder.encode(uSD, forKey: SerializationKeys.uSD)
    aCoder.encode(lAK, forKey: SerializationKeys.lAK)
    aCoder.encode(tWD, forKey: SerializationKeys.tWD)
    aCoder.encode(bND, forKey: SerializationKeys.bND)
    aCoder.encode(gYD, forKey: SerializationKeys.gYD)
    aCoder.encode(fJD, forKey: SerializationKeys.fJD)
    aCoder.encode(kGS, forKey: SerializationKeys.kGS)
    aCoder.encode(aOA, forKey: SerializationKeys.aOA)
    aCoder.encode(gNF, forKey: SerializationKeys.gNF)
    aCoder.encode(cUP, forKey: SerializationKeys.cUP)
    aCoder.encode(bDT, forKey: SerializationKeys.bDT)
    aCoder.encode(oMR, forKey: SerializationKeys.oMR)
    aCoder.encode(iNR, forKey: SerializationKeys.iNR)
    aCoder.encode(mZN, forKey: SerializationKeys.mZN)
    aCoder.encode(jOD, forKey: SerializationKeys.jOD)
    aCoder.encode(tHB, forKey: SerializationKeys.tHB)
    aCoder.encode(cNY, forKey: SerializationKeys.cNY)
    aCoder.encode(cOP, forKey: SerializationKeys.cOP)
    aCoder.encode(lSL, forKey: SerializationKeys.lSL)
    aCoder.encode(cUC, forKey: SerializationKeys.cUC)
    aCoder.encode(aUD, forKey: SerializationKeys.aUD)
    aCoder.encode(xDR, forKey: SerializationKeys.xDR)
    aCoder.encode(pKR, forKey: SerializationKeys.pKR)
    aCoder.encode(eUR, forKey: SerializationKeys.eUR)
    aCoder.encode(zAR, forKey: SerializationKeys.zAR)
    aCoder.encode(lBP, forKey: SerializationKeys.lBP)
    aCoder.encode(mKD, forKey: SerializationKeys.mKD)
    aCoder.encode(tJS, forKey: SerializationKeys.tJS)
    aCoder.encode(sHP, forKey: SerializationKeys.sHP)
    aCoder.encode(vND, forKey: SerializationKeys.vND)
    aCoder.encode(iQD, forKey: SerializationKeys.iQD)
    aCoder.encode(cAD, forKey: SerializationKeys.cAD)
    aCoder.encode(wST, forKey: SerializationKeys.wST)
    aCoder.encode(dJF, forKey: SerializationKeys.dJF)
    aCoder.encode(dKK, forKey: SerializationKeys.dKK)
    aCoder.encode(sBD, forKey: SerializationKeys.sBD)
    aCoder.encode(kES, forKey: SerializationKeys.kES)
    aCoder.encode(pLN, forKey: SerializationKeys.pLN)
    aCoder.encode(jPY, forKey: SerializationKeys.jPY)
    aCoder.encode(tND, forKey: SerializationKeys.tND)
    aCoder.encode(rUB, forKey: SerializationKeys.rUB)
    aCoder.encode(bRL, forKey: SerializationKeys.bRL)
    aCoder.encode(lRD, forKey: SerializationKeys.lRD)
    aCoder.encode(cDF, forKey: SerializationKeys.cDF)
    aCoder.encode(pEN, forKey: SerializationKeys.pEN)
    aCoder.encode(bTC, forKey: SerializationKeys.bTC)
    aCoder.encode(cVE, forKey: SerializationKeys.cVE)
    aCoder.encode(pYG, forKey: SerializationKeys.pYG)
    aCoder.encode(kZT, forKey: SerializationKeys.kZT)
    aCoder.encode(sRD, forKey: SerializationKeys.sRD)
    aCoder.encode(tMT, forKey: SerializationKeys.tMT)
    aCoder.encode(kYD, forKey: SerializationKeys.kYD)
    aCoder.encode(hKD, forKey: SerializationKeys.hKD)
    aCoder.encode(mNT, forKey: SerializationKeys.mNT)
    aCoder.encode(mXN, forKey: SerializationKeys.mXN)
    aCoder.encode(cLF, forKey: SerializationKeys.cLF)
    aCoder.encode(uZS, forKey: SerializationKeys.uZS)
    aCoder.encode(pAB, forKey: SerializationKeys.pAB)
    aCoder.encode(gHS, forKey: SerializationKeys.gHS)
    aCoder.encode(gGP, forKey: SerializationKeys.gGP)
    aCoder.encode(kHR, forKey: SerializationKeys.kHR)
    aCoder.encode(iLS, forKey: SerializationKeys.iLS)
    aCoder.encode(iDR, forKey: SerializationKeys.iDR)
    aCoder.encode(xCD, forKey: SerializationKeys.xCD)
    aCoder.encode(dOP, forKey: SerializationKeys.dOP)
    aCoder.encode(eRN, forKey: SerializationKeys.eRN)
    aCoder.encode(vUV, forKey: SerializationKeys.vUV)
    aCoder.encode(xOF, forKey: SerializationKeys.xOF)
    aCoder.encode(mWK, forKey: SerializationKeys.mWK)
    aCoder.encode(iRR, forKey: SerializationKeys.iRR)
    aCoder.encode(sDG, forKey: SerializationKeys.sDG)
    aCoder.encode(kWD, forKey: SerializationKeys.kWD)
    aCoder.encode(bHD, forKey: SerializationKeys.bHD)
    aCoder.encode(fKP, forKey: SerializationKeys.fKP)
    aCoder.encode(mDL, forKey: SerializationKeys.mDL)
    aCoder.encode(mUR, forKey: SerializationKeys.mUR)
    aCoder.encode(aRS, forKey: SerializationKeys.aRS)
    aCoder.encode(gBP, forKey: SerializationKeys.gBP)
    aCoder.encode(bMD, forKey: SerializationKeys.bMD)
    aCoder.encode(cZK, forKey: SerializationKeys.cZK)
    aCoder.encode(iMP, forKey: SerializationKeys.iMP)
    aCoder.encode(mMK, forKey: SerializationKeys.mMK)
    aCoder.encode(xAG, forKey: SerializationKeys.xAG)
    aCoder.encode(sTD, forKey: SerializationKeys.sTD)
    aCoder.encode(nAD, forKey: SerializationKeys.nAD)
    aCoder.encode(zMW, forKey: SerializationKeys.zMW)
    aCoder.encode(hRK, forKey: SerializationKeys.hRK)
    aCoder.encode(nZD, forKey: SerializationKeys.nZD)
    aCoder.encode(uYU, forKey: SerializationKeys.uYU)
    aCoder.encode(bSD, forKey: SerializationKeys.bSD)
    aCoder.encode(tTD, forKey: SerializationKeys.tTD)
    aCoder.encode(bAM, forKey: SerializationKeys.bAM)
    aCoder.encode(bGN, forKey: SerializationKeys.bGN)
    aCoder.encode(lVL, forKey: SerializationKeys.lVL)
    aCoder.encode(gIP, forKey: SerializationKeys.gIP)
    aCoder.encode(eGP, forKey: SerializationKeys.eGP)
    aCoder.encode(cRC, forKey: SerializationKeys.cRC)
    aCoder.encode(hUF, forKey: SerializationKeys.hUF)
    aCoder.encode(mOP, forKey: SerializationKeys.mOP)
    aCoder.encode(nOK, forKey: SerializationKeys.nOK)
    aCoder.encode(lYD, forKey: SerializationKeys.lYD)
    aCoder.encode(kRW, forKey: SerializationKeys.kRW)
    aCoder.encode(nIO, forKey: SerializationKeys.nIO)
    aCoder.encode(bBD, forKey: SerializationKeys.bBD)
    aCoder.encode(hNL, forKey: SerializationKeys.hNL)
    aCoder.encode(jMD, forKey: SerializationKeys.jMD)
    aCoder.encode(bOB, forKey: SerializationKeys.bOB)
    aCoder.encode(gMD, forKey: SerializationKeys.gMD)
    aCoder.encode(dZD, forKey: SerializationKeys.dZD)
    aCoder.encode(gTQ, forKey: SerializationKeys.gTQ)
    aCoder.encode(kMF, forKey: SerializationKeys.kMF)
    aCoder.encode(qAR, forKey: SerializationKeys.qAR)
    aCoder.encode(uAH, forKey: SerializationKeys.uAH)
    aCoder.encode(sZL, forKey: SerializationKeys.sZL)
    aCoder.encode(sAR, forKey: SerializationKeys.sAR)
    aCoder.encode(aED, forKey: SerializationKeys.aED)
    aCoder.encode(iSK, forKey: SerializationKeys.iSK)
    aCoder.encode(aZN, forKey: SerializationKeys.aZN)
    aCoder.encode(bZD, forKey: SerializationKeys.bZD)
    aCoder.encode(aFN, forKey: SerializationKeys.aFN)
    aCoder.encode(pGK, forKey: SerializationKeys.pGK)
    aCoder.encode(pHP, forKey: SerializationKeys.pHP)
    aCoder.encode(eTB, forKey: SerializationKeys.eTB)
    aCoder.encode(bYR, forKey: SerializationKeys.bYR)
    aCoder.encode(bIF, forKey: SerializationKeys.bIF)
    aCoder.encode(vEF, forKey: SerializationKeys.vEF)
    aCoder.encode(aWG, forKey: SerializationKeys.aWG)
    aCoder.encode(kPW, forKey: SerializationKeys.kPW)
    aCoder.encode(lTL, forKey: SerializationKeys.lTL)
    aCoder.encode(zWL, forKey: SerializationKeys.zWL)
    aCoder.encode(tOP, forKey: SerializationKeys.tOP)
    aCoder.encode(sOS, forKey: SerializationKeys.sOS)
    aCoder.encode(mGA, forKey: SerializationKeys.mGA)
    aCoder.encode(sCR, forKey: SerializationKeys.sCR)
    aCoder.encode(sYP, forKey: SerializationKeys.sYP)
    aCoder.encode(tRY, forKey: SerializationKeys.tRY)
    aCoder.encode(nPR, forKey: SerializationKeys.nPR)
    aCoder.encode(rSD, forKey: SerializationKeys.rSD)
    aCoder.encode(bYN, forKey: SerializationKeys.bYN)
    aCoder.encode(uGX, forKey: SerializationKeys.uGX)
    aCoder.encode(cHF, forKey: SerializationKeys.cHF)
    aCoder.encode(cLP, forKey: SerializationKeys.cLP)
    aCoder.encode(yER, forKey: SerializationKeys.yER)
    aCoder.encode(xPF, forKey: SerializationKeys.xPF)
    aCoder.encode(lKR, forKey: SerializationKeys.lKR)
  }

}
