var Standard = React.createClass({
    getInitialState() {
        return {
            standard: this.props.standard
        }
    },

    render() {
        return (
            <tr>
                <td>{this.state.standard.standard_name}</td>
            </tr>
        );
    }
});