using ProtectedArrays
using Documenter

DocMeta.setdocmeta!(ProtectedArrays, :DocTestSetup, :(using ProtectedArrays); recursive=true)

makedocs(;
    modules=[ProtectedArrays],
    authors="Federico Stra <stra.federico@gmail.com> and contributors",
    sitename="ProtectedArrays.jl",
    format=Documenter.HTML(;
        canonical="https://FedericoStra.github.io/ProtectedArrays.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/FedericoStra/ProtectedArrays.jl",
    devbranch="master",
)
