#r "OSIsoft.AFSDK"
open System.Net
open System.Data
open OSIsoft.AF


let piSystem = (PISystems()).DefaultPISystem
let user = new NetworkCredential("NPMPROD\SRV_PI", "PIP@rk35")
piSystem.Connect(user)
//piSystem.Connect(true, null)
//let dbs = piSystem.Databases
let db = piSystem.Databases.["Northparkes_Mines"]
let tables = db.Tables
let limits = tables.["Limits"]
let data = limits.Table
let hir = data.Select("Asset = '330ML002' AND Attribute = 'Load'")
let row = hir.[0]
let hi = row.Field<float>("Hi")

















//let search = new AFElementSearch(db, "Fin", "Name: 330ML001")
//let els = search.FindElements(fullLoad=true)
//els |> Seq.iter(fun el -> printfn "%A" el)
//let elss = els |> Seq.toList
//let el = elss.Head
//let ela = el.Attributes |> Seq.toList
//let elaa = ela.[1]
//let elaaa = elaa.Attributes.[0]
//elaaa.GetValue()