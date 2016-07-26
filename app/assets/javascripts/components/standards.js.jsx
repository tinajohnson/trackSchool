var Standards = React.createClass({

    render: function() {
        standards = this.props.standards.map( function(standard) {
            return (
                <Standard standard={standard} key={standard.id} />
            );
        });
        return (
            <div>
                <h1>Listing Standards</h1>
                <div id="standards">
                    <table>
                        <thead>
                        <tr>
                            <th>Standard Name</th>
                        </tr>
                        </thead>
                        <tbody>
                        {standards}
                        <tr>
                            <td><a href={this.addNew}>New Standard</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        );
    }
});