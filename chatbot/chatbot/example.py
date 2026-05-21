from langchain_community.document_loaders import DirectoryLoader, PyMuPDFLoader

pdf_loader = DirectoryLoader(
    path='../knowledge_base',
    glob='**/*.pdf',
    loader_cls=PyMuPDFLoader,
    show_progress=True,
    use_multithreading=True
)

doc = pdf_loader.load()
print(doc)