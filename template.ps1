param(
    [string]$ProjectName = "....."
)

python -m venv .venv
.\.venv\Scripts\Activate.ps1

pip install --upgrade pip
pip install numpy pandas scikit-learn matplotlib tqdm python-dotenv jupyter notebook ipykernel

pip freeze > requirements.txt

python -m ipykernel install --user --name=$ProjectName --display-name "Python ($ProjectName)"

$pythonVersion = python -c "import sys; print(sys.version_info.minor)"

$gitignoreContent = @"
__pycache__/
*.pyc
.ipynb_checkpoints/
.env
"@

if ([int]$pythonVersion -lt 12) {
    $gitignoreContent += "`n.venv/"
}

$gitignoreContent | Out-File -FilePath .gitignore -Encoding utf8

Write-Host "Done! Run 'jupyter notebook' to start." -ForegroundColor Green