class See < Formula
  include Language::Python::Virtualenv

  desc "A file opener for the terminal"
  homepage ""
  url "https://files.pythonhosted.org/packages/a0/f4/8221ac66ede1bb679dd6bb90b301461bd038713d7b3bc847e144b6e37040/textualize_see-0.1.1.tar.gz"
  sha256 "422029a2ef68a6750323a846b324993a1f9839461d6e62da33f22ca4c5266d11"

  depends_on "python3"

  resource "click" do
    url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "toml" do
    url "https://files.pythonhosted.org/packages/be/ba/1f744cdc819428fc6b5084ec34d9b30660f6f9daaf70eead706e3203ec3c/toml-0.10.2.tar.gz"
    sha256 "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    false
  end
end
