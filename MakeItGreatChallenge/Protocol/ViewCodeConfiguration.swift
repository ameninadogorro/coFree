import Foundation

protocol ViewCodeConfiguration {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCodeConfiguration {
    func applyViewCode() {
        buildHierarchy()
        setupConstraints( )
        configureViews()
    }
}
